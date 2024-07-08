// ViewModels/BankVerificationViewModel.cs
using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Model;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class BankVerificationViewModel : ObservableObject
    {

        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;


        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private bool isBusy;
        public BankVerificationViewModel(HttpClient httpClient, IAlertService alertService)
        {
            _httpClient = httpClient;
            _alertService = alertService;

            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
            }
        }

        [RelayCommand]
        private async Task VerifyCode()
        {
            if (IsBusy)
                return;

            IsBusy = true;

            var verificationCode = OneCodeEntry + TwoCodeEntry + ThreeCodeEntry + FourCodeEntry;

            var verificationRequest = new VerificationRequest
            {
                Email = Email,
                Code = verificationCode
            };

            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/BankLinks/VerifyCode", verificationRequest);
                if (response.IsSuccessStatusCode)
                {
                    await _alertService.ShowAlertAsync("Success", "Verification successful.", "OK");
                    await Shell.Current.GoToAsync("///HomePage");
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Invalid or expired verification code.", "OK");
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

        [RelayCommand]
        private async Task LinkCard()
        {
            await Shell.Current.GoToAsync("CardLinkSuccess");
        }

        [RelayCommand]
        private async Task Cancel()
        {
            var appShell = (AppShell)Application.Current.MainPage;
            await appShell.NavigateToHomeScreen();
        }
    }
}
