using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Microsoft.Maui.Controls;
using Newtonsoft.Json.Serialization;

namespace Fast_Cash.ViewModels
{
    public partial class SignUpViewModel : ObservableObject
    {
        private readonly IAlertService _alertService;
        private readonly HttpClient _httpClient;

        public SignUpViewModel(IAlertService alertService, HttpClient httpClient)
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
        private string? email;

        [ObservableProperty]
        private string? password;

        [ObservableProperty]
        private string? confirmPassword;

        [ObservableProperty]
        private string? phoneNumber;

        [ObservableProperty]
        private bool isBusy;

        [ObservableProperty]
        private bool termsAccepted;

        [ObservableProperty]
        private bool isPopupVisible;

        [RelayCommand]
        private async Task SignUpAsync()
        {
            if (IsBusy)
                return;

            try
            {
                // Check if terms are accepted
                if (!TermsAccepted)
                {
                    await _alertService.ShowAlertAsync("Sign Up Failed", "Please accept the terms and conditions.", "OK");
                    return;
                }

                // Check if passwords match
                if (Password != ConfirmPassword)
                {
                    await _alertService.ShowAlertAsync("Sign Up Failed", "Passwords do not match.", "OK");
                    return;
                }

                IsBusy = true; // Show the spinner

                var signUpModel = new { Email, Password, PhoneNumber };

                var response = await _httpClient.PostAsJsonAsync("api/signUp", signUpModel);

                if (response.IsSuccessStatusCode)
                {
                    IsBusy = false;
                    var token = await response.Content.ReadAsStringAsync();

                    // Save the token (e.g., in SecureStorage) and navigate to the home screen
                    await SecureStorage.SetAsync("auth_token", token);

                    // Show a success alert
                    await _alertService.ShowAlertAsync("Successful", "You have successfully signed up.", "OK");

                    await Shell.Current.GoToAsync("///SignInPage");
                    //  var appShell = (AppShell)Application.Current.MainPage;
                    //  await appShell.NavigateToHome();
                    }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    IsBusy = false;
                  //  System.Diagnostics.Debug.WriteLine($"Error Response: {errorContent}");
                    await _alertService.ShowAlertAsync("Sign Up Failed", "Check details and try again", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                IsBusy = false;

                await _alertService.ShowAlertAsync("Connection Error", "Try again later.", "OK");
            }
            catch (Exception ex)
            {
                IsBusy = false;
             //   System.Diagnostics.Debug.WriteLine($"Error: {ex}");
                await _alertService.ShowAlertAsync("Sign Up Failed", "Try again later", "OK");
            }
            finally
            {
                IsBusy = false; // Hide the spinner
            }
        }

        [RelayCommand]
        private async Task SignInAsync()
        {
            // Navigate to the sign-in page
            await Shell.Current.GoToAsync("///SignInPage");
        }

        [RelayCommand]
        private async Task GoogleSignUp()
        {
            // Handle Google sign-in logic here
            await _alertService.ShowAlertAsync("Failed", "Not available yet", "OK");
        }

        [RelayCommand]
        private async Task MicrosoftSignUp()
        {
            // Handle Microsoft sign-in logic here
            await _alertService.ShowAlertAsync("Failed", "Not available yet", "OK");
        }

        [RelayCommand]
        private async Task ShowTermsPopup()
        {
            var popup = new Custom_Render.TermsAndConditionsPopup
            {
                BindingContext = this
            };
            Application.Current.MainPage.ShowPopup(popup);
        }
    }
}
