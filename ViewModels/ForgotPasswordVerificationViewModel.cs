using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    [QueryProperty(nameof(Email), "email")]
    public partial class ForgotPasswordVerificationViewModel : ObservableObject
    {
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private string? verificationCode;


        [ObservableProperty]
        private bool isBusy;
        public ForgotPasswordVerificationViewModel(HttpClient httpClient, IAlertService alertService)
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
            IsBusy = true; // Show the spinner

            var verificationModel = new { Email, Code = VerificationCode };
            var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/verify-code", verificationModel);
            if (response.IsSuccessStatusCode)
            {
                IsBusy = false; // hide the spinner
                await Shell.Current.GoToAsync($"//NewPasswordPage?email={Email}");
            }
            else
            {
                IsBusy = false; // hide the spinner
                await _alertService.ShowAlertAsync("Error", "Invalid or expired verification code.", "OK");
            }

            IsBusy = false; // hide the spinner
        }

        [RelayCommand]
        private async Task ResendCode()
        {
            IsBusy = true; // Show the spinner

            var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/send-code", new { Email });
            if (response.IsSuccessStatusCode)
            {
                IsBusy = false; // hide the spinner
                await _alertService.ShowAlertAsync("Code sent successfully", "Your verification code has been sent to your email.", "OK");
            }
            else
            {
                IsBusy = false; // hide the spinner
                await _alertService.ShowAlertAsync("Error", "Failed to send verification code.", "OK");
            }

            IsBusy = false; // hide the spinner
        }
    }
}
