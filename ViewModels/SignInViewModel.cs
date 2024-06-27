using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class SignInViewModel : ObservableObject
    {
        private readonly IAlertService _alertService;
        private readonly HttpClient _httpClient;

        public SignInViewModel(IAlertService alertService, HttpClient httpClient)
        {
            _alertService = alertService;
            _httpClient = httpClient;
        }

        [ObservableProperty]
        private string? emailOrPhone;

        [ObservableProperty]
        private string? password;

        [RelayCommand]
        private async Task SignIn()
        {
            var loginModel = new { Identifier = EmailOrPhone, Password = Password };
            var response = await _httpClient.PostAsJsonAsync("api/Login", loginModel);

            if (response.IsSuccessStatusCode)
            {
                var token = await response.Content.ReadAsStringAsync();
                // Save the token (e.g., in SecureStorage) and navigate to the home screen
                await SecureStorage.SetAsync("auth_token", token);
                var appShell = (AppShell)Application.Current.MainPage;
                await appShell.NavigateToHomeScreen();
            }
            else
            {
                await _alertService.ShowAlertAsync("Login Failed", "Invalid credentials, please try again.", "OK");
            }
        }

        [RelayCommand]
        private async Task NavigateToForgotPassword()
        {
            // Navigate to the forgot password page
            await Shell.Current.GoToAsync("//ForgotPasswordPage");
        }

        [RelayCommand]
        private async Task NavigateToSignUp()
        {
            // Navigate to the sign-up page
            await Shell.Current.GoToAsync("SignUpPage");
        }

        [RelayCommand]
        private void GoogleSignIn()
        {
            // Handle Google sign-in logic here
        }

        [RelayCommand]
        private void MicrosoftSignIn()
        {
            // Handle Microsoft sign-in logic here
        }
    }
}
