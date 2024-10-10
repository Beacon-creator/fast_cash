using System.Net.Http.Json;
using Cashnal.EventHandlers;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Cashnal.Model;
using Newtonsoft.Json.Linq;

namespace Cashnal.ViewModels
    {
    public partial class BankVerificationViewModel : ObservableObject
    {
        private readonly HttpClientService _httpClientService;
        private readonly IAlertService _alertService;
        private readonly JwtService _jwtService;
        private readonly TokenService _tokenService;

        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private string oneCodeEntry;

        [ObservableProperty]
        private string twoCodeEntry;

        [ObservableProperty]
        private string threeCodeEntry;

        [ObservableProperty]
        private string fourCodeEntry;

        [ObservableProperty]
        private bool isBusy;

        public BankVerificationViewModel(HttpClientService httpClientService, IAlertService alertService, JwtService jwtService, TokenService tokenService)
        {
            _httpClientService = httpClientService;
            _alertService = alertService;
            _jwtService = jwtService;
            _tokenService = tokenService;

            // Retrieve the token
            var token = TokenService.GetToken();
            Console.WriteLine($"token: {token}");
            if (!string.IsNullOrEmpty(token))
                {
                Email = JwtService.GetEmailFromToken(token);
                }
            }

        [RelayCommand]
        private async Task VerifyCode()
        {
            if (IsBusy)
                return;

            IsBusy = true;

            var verificationCode = OneCodeEntry + TwoCodeEntry + ThreeCodeEntry + FourCodeEntry;

            var verificationRequest = new VerificationRequest
            {
                Code = verificationCode
            };

            try
            {
                var response = await _httpClientService.PostAsync("api/BankLinks/VerifyCode", JsonContent.Create(verificationRequest));
                if (response.IsSuccessStatusCode)
                {
                    IsBusy = false;
                    await _alertService.ShowAlertAsync("Success", "Verification successful.", "OK");
                    await Shell.Current.GoToAsync("CardLinkSuccess");
                }
                else
                {
                    var errorResponse = await response.Content.ReadAsStringAsync();
                    await _alertService.ShowAlertAsync("Error", "Invalid or expired verification code.", "OK");
                }
            }
            catch (HttpRequestException ex)
            {
                await _alertService.ShowAlertAsync("Network Error", "Try again later", "OK");
            }
            catch (Exception ex)
            {
                await _alertService.ShowAlertAsync("Error", "An error occurred, try again later", "OK");
            }
            finally
            {
                IsBusy = false;
            }
        }


        [RelayCommand]
        private async Task Resend()
        {
            try
            {
                var requestUri = $"api/BankLinks/sendVerificationCode";
                var response = await _httpClientService.PostAsync(requestUri, null);

                if (response.IsSuccessStatusCode)
                {
                    IsBusy = false;
                    var verificationContent = await response.Content.ReadAsStringAsync();

                    var verificationResult = JObject.Parse(verificationContent);
                    var verificationCode = verificationResult["code"]?.ToString();
                    await _alertService.ShowAlertAsync("Success", $"Verification code has been resent: {verificationCode}", "OK");
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Failed to send verification code, try again later", "OK");
                }
            }
            catch (Exception)
            {
                await _alertService.ShowAlertAsync("Error", "Failed to send verification code, try again later", "OK");
                throw;
            }
        }



        [RelayCommand]
        private async Task Cancel()
        {
            var appShell = (AppShell)Application.Current.MainPage;
            await appShell.NavigateToHome();
        }
    }
}
