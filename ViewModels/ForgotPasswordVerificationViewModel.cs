using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Cashnal.EventHandlers;
using Microsoft.Maui.Controls;

namespace Cashnal.ViewModels
    {
    [QueryProperty(nameof(Email), "email")]
    public partial class ForgotPasswordVerificationViewModel : ObservableObject
        {
        private readonly HttpClient _httpClient;
        private readonly HttpClientService _httpClientService;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private string? verificationCode;

        [ObservableProperty]
        private bool isBusy;

        public ForgotPasswordVerificationViewModel(HttpClient httpClient, HttpClientService httpClientService, IAlertService alertService)
            {
            _httpClient = httpClient;
            _httpClientService = httpClientService;
            _alertService = alertService;

            if (_httpClient.BaseAddress == null)
                {
                _httpClient.BaseAddress = new Uri("https://grabbyfanalapi.onrender.com/");
                }
            }

        [RelayCommand]
        private async Task VerifyCode()
            {
            if (string.IsNullOrWhiteSpace(VerificationCode))
                {
                await _alertService.ShowAlertAsync("Error", "Verification code cannot be empty.", "OK");
                return;
                }

            try
                {
                IsBusy = true; // Show the spinner

                var verificationModel = new { email = Email, code = VerificationCode };
                var response = await _httpClient.PostAsJsonAsync("api/password-reset/verify-code", verificationModel);

                if (response.IsSuccessStatusCode)
                    {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    var jsonDocument = JsonDocument.Parse(responseContent);

                    if (jsonDocument.RootElement.TryGetProperty("token", out JsonElement tokenElement))
                        {
                        string token = tokenElement.GetString();      

                        await _alertService.ShowAlertAsync("Success", "Code verified successfully.", "OK");

                        // Use Uri.EscapeDataString to ensure the token is correctly encoded
                        await Shell.Current.GoToAsync($"//NewPasswordPage?email={Email}&token={Uri.EscapeDataString(token)}");
                        }
                    else
                        {
                        await _alertService.ShowAlertAsync("Error", "Please, log in again.", "OK");
                        }
                    }
                else
                    {
                    // Log and display detailed error response
                    var errorContent = await response.Content.ReadAsStringAsync();
                    System.Diagnostics.Debug.WriteLine($"Error Content: {errorContent}");

                    // Attempt to parse the error message from server response
                    try
                        {
                        var jsonDocument = JsonDocument.Parse(errorContent);
                        if (jsonDocument.RootElement.TryGetProperty("message", out JsonElement messageElement))
                            {
                            string errorMessage = messageElement.GetString();
                            await _alertService.ShowAlertAsync("Error", $"Verification failed: {errorMessage}", "OK");
                            }
                        else
                            {
                            await _alertService.ShowAlertAsync("Error", "Invalid or expired verification code.", "OK");
                            }
                        }
                    catch (JsonException)
                        {
                        // Fallback in case the response is not a valid JSON
                        await _alertService.ShowAlertAsync("Error", "Invalid or expired verification code.", "OK");
                        }
                    }
                }
            catch (HttpRequestException)
                {
                await _alertService.ShowAlertAsync("Network error", "Check network connection and try again", "OK");
                }
            catch (Exception)
                {
                await _alertService.ShowAlertAsync("Error", "An error occurred, please try again", "OK");
                }
            finally
                {
                IsBusy = false; // Hide the spinner
                }
            }


        [RelayCommand]
        private async Task ResendCode()
            {
            if (string.IsNullOrWhiteSpace(Email))
                {
                await _alertService.ShowAlertAsync("Error", "Email cannot be empty.", "OK");
                return;
                }

            try
                {
                IsBusy = true; // Show the spinner

                var response = await _httpClient.PostAsJsonAsync("api/password-reset/send-code", new { email = Email });

                if (response.IsSuccessStatusCode)
                    {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    var jsonDocument = JsonDocument.Parse(responseContent);

                    if (jsonDocument.RootElement.TryGetProperty("message", out JsonElement messageElement) &&
                        jsonDocument.RootElement.TryGetProperty("verificationCode", out JsonElement verificationCodeElement))
                        {
                        string verificationCode = verificationCodeElement.GetString();
                        await _alertService.ShowAlertAsync("Code sent successfully", $"Your verification code is: {verificationCode}", "OK");
                        }
                    else
                        {
                        await _alertService.ShowAlertAsync("Error", "Failed to parse the verification code.", "OK");
                        }
                    }
                else
                    {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    await _alertService.ShowAlertAsync("Error", $"Failed to resend verification code. {errorContent}", "OK");
                    }
                }
            catch (HttpRequestException)
                {
                await _alertService.ShowAlertAsync("Network error", "Check network connection and try again", "OK");
                }
            catch (Exception)
                {
                await _alertService.ShowAlertAsync("Error", "An error occurred, please try again", "OK");
                }
            finally
                {
                IsBusy = false; // Hide the spinner
                }
            }
        }
    }
