using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Cashnal.EventHandlers;
using Microsoft.Maui.Controls;

namespace Cashnal.ViewModels
    {
    public partial class SignInViewModel : ObservableObject
        {
        private readonly IAlertService _alertService;
        private readonly HttpClient _httpClient;

        public SignInViewModel(IAlertService alertService, HttpClient httpClient)
            {
            _alertService = alertService;
            _httpClient = httpClient;

            // Set the base address for HttpClient if not set
            if (_httpClient.BaseAddress == null)
                {
                _httpClient.BaseAddress = new Uri("https://grabbyfanalapi.onrender.com/");
                }
            }

        [ObservableProperty]
        private string? emailOrPhone;

        [ObservableProperty]
        private string? password;

        [ObservableProperty]
        private bool isBusy;

        // Sign in command to authenticate the user
        [RelayCommand]
        private async Task SignIn()
            {
            if (IsBusy)
                return;

            try
                {
                if (string.IsNullOrEmpty(EmailOrPhone) || string.IsNullOrEmpty(Password))
                    {
                    await _alertService.ShowAlertAsync("Failed", "Please fill in all details.", "OK");
                    return;
                    }

                IsBusy = true;

                // Prepare the login request model
                var loginModel = new { identifier = EmailOrPhone, password = Password };
                var response = await _httpClient.PostAsJsonAsync("api/login", loginModel);

                if (response.IsSuccessStatusCode)
                    {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    var tokenObject = JsonSerializer.Deserialize<TokenResponse>(jsonResponse);

                    if (tokenObject != null && !string.IsNullOrEmpty(tokenObject.Token))
                        {
                        var token = tokenObject.Token;

                        // Save the token securely
                        await SecureStorage.SetAsync("auth_token", token);

                        // Extract email from token using JwtService
                        var email = JwtService.GetEmailFromToken(token);

                        if (email != null)
                            {
                            await _alertService.ShowAlertAsync("Login Successful", "You have successfully signed in.", "OK");

                            // Navigate to the home screen
                            var appShell = (AppShell)Application.Current.MainPage;
                            await appShell.NavigateToHomeScreen(email);
                            }
                        else
                            {
                            await _alertService.ShowAlertAsync("Login Failed", "Email not found in token.", "OK");
                            }
                        }
                    else
                        {
                        await _alertService.ShowAlertAsync("Login Failed", "Invalid token received.", "OK");
                        }
                    }
                else
                    {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    await _alertService.ShowAlertAsync("Login Failed", "Invalid credentials, please try again.", "OK");
                    System.Diagnostics.Debug.WriteLine($"Error Response: {errorContent}");
                    }
                }
            catch (HttpRequestException)
                {
                await _alertService.ShowAlertAsync("Login Failed", "A connection error occurred", "OK");
                }
            catch (Exception ex)
                {
                System.Diagnostics.Debug.WriteLine($"Error: {ex}");
                await _alertService.ShowAlertAsync("Login Failed", "An unexpected error occurred, please try again.", "OK");
                }
            finally
                {
                IsBusy = false;
                }
            }

        // Example of how you can retrieve and use the token for authenticated requests
        //public async Task MakeAuthenticatedRequestAsync()
        //    {
        //    var token = await SecureStorage.GetAsync("auth_token");
        //    if (!string.IsNullOrEmpty(token))
        //        {
        //        _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        //        // Example: Making an authenticated API request
        //        var response = await _httpClient.GetAsync("api/protected-endpoint");

        //        if (response.IsSuccessStatusCode)
        //            {
        //            var content = await response.Content.ReadAsStringAsync();
        //            // Process the content (e.g., display data)
        //            }
        //        else
        //            {
        //            var errorContent = await response.Content.ReadAsStringAsync();
        //            System.Diagnostics.Debug.WriteLine($"Error Response: {errorContent}");
        //            await _alertService.ShowAlertAsync("Error", "Failed to load data.", "OK");
        //            }
        //        }
        //    else
        //        {
        //        await _alertService.ShowAlertAsync("Error", "Authentication token not found.", "OK");
        //        }
        //    }

        [RelayCommand]
        private async Task NavigateToForgotPassword()
            {
            await Shell.Current.GoToAsync("//ForgotPasswordPage");
            }

        [RelayCommand]
        private async Task NavigateToSignUp()
            {
            await Shell.Current.GoToAsync("SignUpPage");
            }

        [RelayCommand]
        private async Task GoogleSignIn()
            {
            await _alertService.ShowAlertAsync("Login Failed", "This service is not yet available.", "OK");
            }

        [RelayCommand]
        private async Task MicrosoftSignIn()
            {
            await _alertService.ShowAlertAsync("Login Failed", "This service is not yet available.", "OK");
            }

        private class TokenResponse
            {
            [JsonPropertyName("token")]
            public string? Token { get; set; }
            }
        }
    }
