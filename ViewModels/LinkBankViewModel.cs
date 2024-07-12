using System;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Model;
using Microsoft.Maui.Controls;
using Newtonsoft.Json.Linq;

namespace Fast_Cash.ViewModels
{
    public partial class LinkBankViewModel : ObservableObject
    {
        private readonly HttpClientService _httpClientService;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? accountOwnerName;

        [ObservableProperty]
        private string? accountNumber;

        [ObservableProperty]
        private string? bvnNumber;

        [ObservableProperty]
        private bool isBusy;

        public LinkBankViewModel(HttpClientService httpClientService, IAlertService alertService)
        {
            _httpClientService = httpClientService;
            _alertService = alertService;
        }

        [RelayCommand]
        private async Task LinkBankAccount()
        {
            if (IsBusy)
                return;

            try
            {
                // Validate required fields
                if (string.IsNullOrEmpty(AccountOwnerName) || string.IsNullOrEmpty(AccountNumber) || string.IsNullOrEmpty(BvnNumber))
                {
                    await _alertService.ShowAlertAsync("Failed", "Please fill in all details.", "OK");
                    return;
                }

                IsBusy = true;

                var bankLink = new BankLink
                {
                    AccountOwnerName = AccountOwnerName,
                    AccountNumber = AccountNumber,
                    BVN = BvnNumber
                };

                var response = await _httpClientService.PostAsync("api/BankLinks", JsonContent.Create(bankLink));
                var responseContent = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"Response Content: {responseContent}");

                if (response.IsSuccessStatusCode)
                {
                    await _alertService.ShowAlertAsync("Success", "Bank account linked successfully.", "OK");

                    // Send verification code
                    var verificationResponse = await SendVerificationCode();
                    var verificationContent = await verificationResponse.Content.ReadAsStringAsync();
                    Console.WriteLine($"Verification Response Content: {verificationContent}");

                    if (verificationResponse.IsSuccessStatusCode)
                    {
                        var verificationResult = JObject.Parse(verificationContent);
                        var verificationCode = verificationResult["code"]?.ToString();

                        await _alertService.ShowAlertAsync("Verification", $"Verification code sent successfully. Your code is: {verificationCode}", "OK");
                        await Shell.Current.GoToAsync("//BankVerificationPage");
                    }
                    else
                    {
                        await _alertService.ShowAlertAsync("Error", $"Failed to send verification code. Server response: {verificationContent}", "OK");
                    }
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", $"Failed to link bank account. Server response: {responseContent}", "OK");
                }
            }
            catch (HttpRequestException ex)
            {
                await _alertService.ShowAlertAsync("Error", $"Request error: {ex.Message}", "OK");
            }
            catch (Exception ex)
            {
                await _alertService.ShowAlertAsync("Error", $"An error occurred: {ex.Message}", "OK");
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
                var requestUri = $"api/BankLinks/sendVerificationCode";
                return await _httpClientService.PostAsync(requestUri, null);
            }
            catch (Exception ex)
            {
                await _alertService.ShowAlertAsync("Error", $"Failed to send verification code: {ex.Message}", "OK");
                throw;
            }
        }
    }
}
