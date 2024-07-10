// ViewModels/BankVerificationViewModel.cs
using System;
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
        private readonly HttpClientService _httpClientService;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private string oneCodeEntry;

        [ObservableProperty]
        private string twoCodeEntry;

        [ObservableProperty]
        private string threeCodeEntry;

        [ObservableProperty]
        private string fourCodeEntry;

        [ObservableProperty]
        private bool isBusy;

        public BankVerificationViewModel(HttpClientService httpClientService, IAlertService alertService)
        {
            _httpClientService = httpClientService;
            _alertService = alertService;
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
                var response = await _httpClientService.PostAsync("api/BankLinks/VerifyCode", JsonContent.Create(verificationRequest));
                if (response.IsSuccessStatusCode)
                {
                    await _alertService.ShowAlertAsync("Success", "Verification successful.", "OK");
                    await Shell.Current.GoToAsync("///HomePage");
                }
                else
                {
                    var errorResponse = await response.Content.ReadAsStringAsync();
                    await _alertService.ShowAlertAsync("Error", $"Invalid or expired verification code. Server response: {errorResponse}", "OK");
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
