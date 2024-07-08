using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Model;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class LinkBankViewModel : ObservableObject
    {
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string accountOwnerName;

        [ObservableProperty]
        private string accountNumber;

        [ObservableProperty]
        private string bvnNumber;

        [ObservableProperty]
        private bool isBusy;

        public LinkBankViewModel(HttpClient httpClient, IAlertService alertService)
        {
            _httpClient = httpClient;
            _alertService = alertService;

            // Set the base address if it is not already set
            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
            }
        }

        [RelayCommand]
        private async Task LinkBankAccount()
        {
            if (IsBusy)
                return;

            IsBusy = true;

            var bankLink = new BankLink
            {
                AccountOwnerName = AccountOwnerName,
                AccountNumber = AccountNumber,
                BVN = BvnNumber
            };

            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/BankLinks", bankLink);
                if (response.IsSuccessStatusCode)
                {
                    await _alertService.ShowAlertAsync("Success", "Bank account linked successfully.", "OK");

                    // Send verification code
                    var verificationResponse = await SendVerificationCode();
                    if (verificationResponse.IsSuccessStatusCode)
                    {
                        var verificationCode = await verificationResponse.Content.ReadAsStringAsync();
                        await _alertService.ShowAlertAsync("Verification", $"Verification code sent: {verificationCode}", "OK");
                        await Shell.Current.GoToAsync("//BankVerificationPage");
                    }
                    else
                    {
                        await Application.Current.MainPage.DisplayAlert("Error", "Failed to send verification code.", "OK");
                    }
                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Failed to link bank account.", "OK");
                }
            }
            catch (HttpRequestException ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Request error: {ex.Message}", "OK");
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
            finally
            {
                IsBusy = false;
            }
        }

        private async Task<HttpResponseMessage> SendVerificationCode()
        {
            try
            {
                var requestUri = $"api/BankLinks/sendVerificationCode?email={AccountOwnerName}";
                return await _httpClient.PostAsync(requestUri, null);
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Failed to send verification code: {ex.Message}", "OK");
                throw;
            }
        }
    }
}
