﻿using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Cashnal.EventHandlers;
using Microsoft.Maui.Controls;

namespace Cashnal.ViewModels
{
    public partial class ForgotPasswordViewModel : ObservableObject
    {
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;
        private readonly HttpClientService _httpClientService;

        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private bool isBusy;

        public ForgotPasswordViewModel(HttpClient httpClient, HttpClientService httpClientService, IAlertService alertService)
        {
            _httpClient = httpClient;
            _httpClientService = httpClientService;
            _alertService = alertService;

            // Set the base address if it is not already set
            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://grabbyfanalapi.onrender.com/");
                }
        }

        [RelayCommand]
        private async Task RequestPasswordReset()
        {
            try
            {
                if (string.IsNullOrEmpty(Email))
                {
                    await _alertService.ShowAlertAsync("Failed", "Please input your registered email address.", "OK");
                    return;
                }
                IsBusy = true; // show the spinner

                var response = await _httpClient.PostAsJsonAsync("api/password-reset/send-code", new { email = Email });


                if (response.IsSuccessStatusCode)
                {
                    IsBusy = false;
                    var responseContent = await response.Content.ReadFromJsonAsync<PasswordResetResponse>();
                    var verificationCode = responseContent?.VerificationCode; // Get the verification code from the response


                    // Log the verification code
                    System.Diagnostics.Debug.WriteLine($"Verification Code: {verificationCode}");

                    await _alertService.ShowAlertAsync("Code sent successfully", $"Your verification code is: {verificationCode}", "OK");

                    // Navigate to ForgotPasswordVerificationPage with the email as a query parameter
                    await Shell.Current.GoToAsync($"//ForgotPasswordVerificationPage?email={Email}");
                }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    // Log the error response
                  //  System.Diagnostics.Debug.WriteLine($"Error Content: {errorContent}");

                    await _alertService.ShowAlertAsync("Error", "Not sent,Check if your email is correct", "OK");
                }
            }
            catch (HttpRequestException)
            {
                // Handle HTTP request exceptions
                //   System.Diagnostics.Debug.WriteLine($"HttpRequestException: {httpEx.Message}");
                await _alertService.ShowAlertAsync("Network error", "Check network connection and try again", "OK");
                }
            catch (Exception)
            {
                // Log the exception
              //  System.Diagnostics.Debug.WriteLine($"Exception: {ex.Message}");
                await _alertService.ShowAlertAsync("Error", "An error occurred", "OK");
            }
            finally
            {
                IsBusy = false; // hide the spinner
            }
        }
    }

    // Define a model class for the expected API response
    public class PasswordResetResponse
        {
        public string? Message { get; set; }
        public string? VerificationCode { get; set; }
        }
    }
