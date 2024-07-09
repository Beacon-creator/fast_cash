using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text.Json;
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
            try
            {
                IsBusy = true; // Show the spinner

                var verificationModel = new { Email, Code = VerificationCode };
                var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/verify-code", verificationModel);

                if (response.IsSuccessStatusCode)
                {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    System.Diagnostics.Debug.WriteLine($"Response Content: {responseContent}"); // Debug output

                    var jsonDocument = JsonDocument.Parse(responseContent);
                    if (jsonDocument.RootElement.TryGetProperty("token", out JsonElement tokenElement))
                    {
                        string token = tokenElement.GetString();
                        System.Diagnostics.Debug.WriteLine($"Extracted Token: {token}"); // Debug output

                        IsBusy = false; // hide the spinner

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
                System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Error", $"A connection error occurred: {httpEx.Message}", "OK");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Error", $"An error occurred: {ex.Message}", "OK");
            }
            finally
            {
                IsBusy = false; // hide the spinner
            }
        }

        [RelayCommand]
        private async Task ResendCode()
        {
            try
            {
                IsBusy = true; // Show the spinner

                var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/send-code", new { Email });
                if (response.IsSuccessStatusCode)
                {
                    var verificationCode = await response.Content.ReadAsStringAsync(); // Assuming the code is returned as plain text

                    await _alertService.ShowAlertAsync("Code sent successfully", $"Your verification code is: {verificationCode}", "OK");
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Failed to send verification code.", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Error", $"A connection error occurred: {httpEx.Message}", "OK");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Error", $"An error occurred: {ex.Message}", "OK");
            }
            finally
            {
                IsBusy = false; // hide the spinner
            }
        }
    }
}
