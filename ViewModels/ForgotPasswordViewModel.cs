using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class ForgotPasswordViewModel : ObservableObject
    {
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? email;


        [ObservableProperty]
        private bool isBusy;
        public ForgotPasswordViewModel(HttpClient httpClient, IAlertService alertService)
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
        private async Task RequestPasswordReset()
        {
            IsBusy = true; // show the spinner
            var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/send-code", Email);
            if (response.IsSuccessStatusCode)
            {
                var verificationCode = await response.Content.ReadAsStringAsync(); // Assuming the code is returned as plain text
                await _alertService.ShowAlertAsync("Code sent successfully", $"Your verification code is: {verificationCode}", "OK");

                IsBusy = false; // hide the spinner

                // Navigate to ForgotPasswordVerificationPage with the email as a query parameter
                await Shell.Current.GoToAsync($"//ForgotPasswordVerificationPage?email={Email}");


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
