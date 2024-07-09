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

            // Set the base address if it is not already set
            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
            }
        }

        [ObservableProperty]
        private string? emailOrPhone;

        [ObservableProperty]
        private string? password;

        [ObservableProperty]
        private bool isBusy;

        [RelayCommand]
        private async Task SignIn()
        {
            try
            {
                IsBusy = true; // Show the spinner

                var loginModel = new { Identifier = EmailOrPhone, Password = Password };
                var response = await _httpClient.PostAsJsonAsync("api/login", loginModel);

                if (response.IsSuccessStatusCode)
                {
                    IsBusy = false;
                    var token = await response.Content.ReadAsStringAsync();
                    // Save the token (e.g., in SecureStorage) and navigate to the home screen
                    await SecureStorage.SetAsync("auth_token", token);

                    // Show a success alert
                    await _alertService.ShowAlertAsync("Login Successful", "You have successfully signed in.", "OK");

                    var appShell = (AppShell)Application.Current.MainPage;
                    await appShell.NavigateToHomeScreen();
                }
                else
                {
                    IsBusy = false;
                    var errorContent = await response.Content.ReadAsStringAsync();
                    // Log the error response
                    System.Diagnostics.Debug.WriteLine($"Error Response: {errorContent}");
                    await _alertService.ShowAlertAsync("Login Failed", $"Invalid credentials, please try again. {errorContent}", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                IsBusy = false;
                // Handle HTTP request exceptions
                System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Login Failed", $"A connection error occurred: {httpEx.Message}", "OK");
            }
            catch (Exception ex)
            {
                IsBusy = false;
                // Log the exception
                System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Login Failed", $"An error occurred: {ex.Message}", "OK");
            }
            finally
            {
                IsBusy = false; // Hide the spinner
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
        private async Task GoogleSignIn()
        {
            // Handle Google sign-in logic here
            await _alertService.ShowAlertAsync("Login Failed", "This service is not yet available.", "OK");
        }

        [RelayCommand]
        private async Task MicrosoftSignIn()
        {
            // Handle Microsoft sign-in logic here
            await _alertService.ShowAlertAsync("Login Failed", "This service is not yet available.", "OK");
        }
    }
}
