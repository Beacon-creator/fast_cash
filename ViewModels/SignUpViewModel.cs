using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Microsoft.Maui.Controls;

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

                // Log the data being sent
                System.Diagnostics.Debug.WriteLine($"SignUp Data: {Newtonsoft.Json.JsonConvert.SerializeObject(signUpModel)}");

                var response = await _httpClient.PostAsJsonAsync("api/signUp", signUpModel);

                // Log the response status code
                System.Diagnostics.Debug.WriteLine($"Response Status Code: {response.StatusCode}");

                if (response.IsSuccessStatusCode)
                {
                    var token = await response.Content.ReadAsStringAsync();

                    // Log the token received
                    System.Diagnostics.Debug.WriteLine($"Token: {token}");

                    // Save the token (e.g., in SecureStorage) and navigate to the home screen
                    await SecureStorage.SetAsync("auth_token", token);

                    // Show a success alert
                    await _alertService.ShowAlertAsync("Sign Up Successful", "You have successfully signed up.", "OK");

                    var appShell = (AppShell)Application.Current.MainPage;
                    await appShell.NavigateToHomeScreen();
                }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();

                    // Log the error response
                    System.Diagnostics.Debug.WriteLine($"Error Response: {errorContent}");
                    IsBusy = false;
                    await _alertService.ShowAlertAsync("Sign Up Failed", $"An error occurred: {errorContent}", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                // Handle HTTP request exceptions
                System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Sign Up Failed", $"A connection error occurred: {httpEx.Message}", "OK");
            }
            catch (Exception ex)
            {
                // Log the exception
                System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Sign Up Failed", $"An error occurred: {ex.Message}", "OK");
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
            await Shell.Current.GoToAsync("SignInPage");
        }

        [RelayCommand]
        private async Task GoogleSignUp()
        {
            // Handle Google sign-in logic here
            await _alertService.ShowAlertAsync("Failed", "Not avaialable yet", "OK");
        }

        [RelayCommand]
        private async Task MicrosoftSignUp()
        {
            // Handle Microsoft sign-in logic here

            await _alertService.ShowAlertAsync("Failed", "Not avaialable yet", "OK");
        }

        //[RelayCommand]
        //private void ShowPopup()
        //{
        //    IsPopupVisible = true;
        //}

        //[RelayCommand]
        //private void HidePopup()
        //{
        //    IsPopupVisible = false;
        //}

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
