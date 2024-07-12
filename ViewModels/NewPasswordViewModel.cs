﻿using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using Fast_Cash.EventHandlers;

namespace Fast_Cash.ViewModels
{
    public partial class NewPasswordViewModel : ObservableObject, IQueryAttributable
    {
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private string? password;

        [ObservableProperty]
        private string? confirmPassword;

        [ObservableProperty]
        private bool isBusy;

        private string? token;

        public NewPasswordViewModel(HttpClient httpClient, IAlertService alertService)
        {
            _httpClient = httpClient;
            _alertService = alertService;

            // Set the base address if it is not already set
            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
            }
        }

        public void ApplyQueryAttributes(IDictionary<string, object> query)
        {
            if (query.ContainsKey("email"))
            {
                Email = query["email"]?.ToString();
            }
            if (query.ContainsKey("token"))
            {
                token = Uri.UnescapeDataString(query["token"]?.ToString());
            }
       //     System.Diagnostics.Debug.WriteLine($"Email: {Email}, Token: {token}"); // Debug output
        }

        [RelayCommand]
        private async Task ResetPassword()
        {
            if (IsBusy)
                return;

            try
            {
                // Check if required fields are filled
                if (string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password) || string.IsNullOrEmpty(ConfirmPassword))
                {
                    await _alertService.ShowAlertAsync("Error", "Please fill in all details.", "OK");
                    return;
                }

                // Check if passwords match
                if (Password != ConfirmPassword)
                {
                    await _alertService.ShowAlertAsync("Error", "Passwords do not match.", "OK");
                    return;
                }

                IsBusy = true; // show the spinner

                var resetPasswordModel = new { Email, Password, Token = token };
                var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/reset-password", resetPasswordModel);

                if (response.IsSuccessStatusCode)
                {
                    // Log success response
                //    System.Diagnostics.Debug.WriteLine("Password reset successful");

                    await _alertService.ShowAlertAsync("Success", "Password has been reset successfully.", "OK");
                    await Shell.Current.GoToAsync("//SignInPage");
                }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    // Log the error response
               //     System.Diagnostics.Debug.WriteLine($"Error Content: {errorContent}");

                    await _alertService.ShowAlertAsync("Error", "Failed to reset password", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                // Handle HTTP request exceptions
             //   System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Error", "A connection error occurred", "OK");
            }
            catch (Exception ex)
            {
                // Log the exception
             //   System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Error", "An error occurred", "OK");
            }
            finally
            {
                IsBusy = false; // hide the spinner
            }
        }
    }
}
