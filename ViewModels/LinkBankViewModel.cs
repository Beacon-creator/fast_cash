using System;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Cashnal.EventHandlers;
using Cashnal.Model;
using Microsoft.Maui.Controls;
using Newtonsoft.Json.Linq;

namespace Cashnal.ViewModels
    {
    public partial class LinkBankViewModel : ObservableObject
        {
        private readonly HttpClientService _httpClientService;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? accountOwnerName;

        [ObservableProperty]
        private string? accountNumber;

        [ObservableProperty]
        private string? bvnNumber;

        [ObservableProperty]
        private bool isBusy;

        public LinkBankViewModel(HttpClientService httpClientService, IAlertService alertService)
            {
            _httpClientService = httpClientService;
            _alertService = alertService;
            }

        [RelayCommand]
        private async Task LinkBankAccount()
            {
            if (IsBusy)
                return;

            try
                {
                IsBusy = true;

                var bankLink = new BankLink
                    {
                    AccountOwnerName = AccountOwnerName,
                    AccountNumber = AccountNumber,
                    BVN = BvnNumber
                    };

                var response = await _httpClientService.PostAsync("api/bank-link", JsonContent.Create(bankLink));
                var responseContent = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                    {
                    await _alertService.ShowAlertAsync("Success", "Bank account linked successfully.", "OK");

                    // Send verification code
                    var verificationResponse = await SendVerificationCode();
                    var verificationContent = await verificationResponse.Content.ReadAsStringAsync();
                  

                    if (verificationResponse.IsSuccessStatusCode)
                        {
                        // Parse and check if the code exists in the response
                        var verificationResult = JObject.Parse(verificationContent);
                        if (verificationResult["code"] != null)
                            {
                            var verificationCode = verificationResult["code"]?.ToString();
                        

                            await _alertService.ShowAlertAsync("Verification", $"Verification code sent successfully. Your code is: {verificationCode}", "OK");
                            await Shell.Current.GoToAsync("//BankVerificationPage");
                            }
                        else
                            {
                            // If the code doesn't exist in the response
                            await _alertService.ShowAlertAsync("Error", "Verification code is missing in the response.", "OK");
                            }
                        }
                    else
                        {
                        await _alertService.ShowAlertAsync("Error", "Failed to send verification code. Please try again.", "OK");
                        }
                    }
                else
                    {
                    await _alertService.ShowAlertAsync("Error", "Failed to link bank account. Please try again.", "OK");
                    }
                }
            catch (HttpRequestException)
                {
                await _alertService.ShowAlertAsync("Network error", "Check network connection and try again.", "OK");
                }
            catch (Exception)
                {
               
                await _alertService.ShowAlertAsync("Error", "An error occurred. Please try again later.", "OK");
                }
            finally
                {
                IsBusy = false;
                }
            }

        private async Task<HttpResponseMessage> SendVerificationCode()
            {
            try
                {
                var requestUri = $"api/bank-link/send-verification-code";
                return await _httpClientService.PostAsync(requestUri, null);
                }
            catch (Exception)
                {
                await _alertService.ShowAlertAsync("Error", "Failed to send verification code, please try again", "OK");
                throw;
                }
            }
        }
    }
