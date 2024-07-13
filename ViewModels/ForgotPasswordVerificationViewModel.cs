using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Microsoft.Maui.Controls;
using Newtonsoft.Json.Serialization;

namespace Fast_Cash.ViewModels
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
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
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

                var verificationModel = new { Email, Code = VerificationCode };
                var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/verify-code", verificationModel);

                if (response.IsSuccessStatusCode)
                {
                    IsBusy = false;
                    var responseContent = await response.Content.ReadAsStringAsync();
                   // System.Diagnostics.Debug.WriteLine($"Response Content: {responseContent}"); // Debug output

                    var jsonDocument = JsonDocument.Parse(responseContent);
                    if (jsonDocument.RootElement.TryGetProperty("token", out JsonElement tokenElement))
                    {
                        string token = tokenElement.GetString();
                      //  System.Diagnostics.Debug.WriteLine($"Extracted Token: {token}"); // Debug output

                        // Use Uri.EscapeDataString to ensure the token is correctly encoded
                        await Shell.Current.GoToAsync($"//NewPasswordPage?email={Email}&token={Uri.EscapeDataString(token)}");
                    }
                    else
                    {
                        await _alertService.ShowAlertAsync("Error", "Token is missing in the response.", "OK");
                    }
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Invalid or expired verification code.", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                //  System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Network error", "Check network connection and try again", "OK");
                }
            catch (Exception ex)
            {
               // System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Error", "An error occurred, please try again", "OK");
            }
            finally
            {
                IsBusy = false; // hide the spinner
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

                var emailContent = new StringContent($"\"{Email}\"", System.Text.Encoding.UTF8, "application/json");
             //   System.Diagnostics.Debug.WriteLine($"Email Content: {emailContent.ReadAsStringAsync().Result}"); // Debug output

                var response = await _httpClient.PostAsync("api/PasswordReset/send-code", emailContent);

                if (response.IsSuccessStatusCode)
                    {
                    IsBusy = false;
                    var verificationCode = await response.Content.ReadAsStringAsync(); // Assuming the code is returned as plain text

                    await _alertService.ShowAlertAsync("Code sent successfully", $"Your verification code is: {verificationCode}", "OK");
                    }
                else
                    {
                    var errorContent = await response.Content.ReadAsStringAsync();
                 //   System.Diagnostics.Debug.WriteLine($"Error Content: {errorContent}"); // Debug output
                    await _alertService.ShowAlertAsync("Error", "Failed to resend verification code.", "OK");
                    }
                }
            catch (HttpRequestException httpEx)
                {
              //  System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Network error", "Check network connection and try again", "OK");
                }
            catch (Exception ex)
                {
             //   System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Error", "An error occurred, please try again", "OK");
                }
            finally
                {
                IsBusy = false; // hide the spinner
                }
            }

        }
    }
