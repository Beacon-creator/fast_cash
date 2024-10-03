using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text.Json;
using System.Text.Json.Serialization;
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

                var loginModel = new { identifier = EmailOrPhone, password = Password };
                var response = await _httpClient.PostAsJsonAsync("api/login", loginModel);

                if (response.IsSuccessStatusCode)
                    {
                    IsBusy = false;
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    var tokenObject = JsonSerializer.Deserialize<TokenResponse>(jsonResponse);

                    if (tokenObject != null)
                        {
                        var token = tokenObject.Token;
                        if (!string.IsNullOrEmpty(token))
                            {
                            var jwtService = new JwtService();
                            var email = jwtService.GetEmailFromToken(token);

                            if (email != null)
                                {
                                await SecureStorage.SetAsync("auth_token", token);
                                await _alertService.ShowAlertAsync("Login Successful", "You have successfully signed in.", "OK");

                                // Navigate to HomePage and pass the email as a query parameter
                                var appShell = (AppShell)Application.Current.MainPage;
                                await appShell.NavigateToHomeScreen(email);
                                }
                            else
                                {
                                await _alertService.ShowAlertAsync("Login Failed", "Email not found in the token. Please check the claims in the console log.", "OK");
                                }
                            }
                        else
                            {
                            await _alertService.ShowAlertAsync("Login Failed", "Received token is not a valid JWT.", "OK");
                            }
                        }
                    else
                        {
                        await _alertService.ShowAlertAsync("Login Failed", "Received token is not a valid JWT.", "OK");
                        }
                    }
                else
                    {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    await _alertService.ShowAlertAsync("Login Failed", "Invalid credentials, please try again.", "OK");
                    }
                }
            catch (HttpRequestException httpEx)
                {
                await _alertService.ShowAlertAsync("Login Failed", "A connection error occurred", "OK");
                }
            catch (Exception ex)
                {
                await _alertService.ShowAlertAsync("Login Failed", "Try again later.", "OK");
                }
            finally
                {
                IsBusy = false;
                }
            }

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
