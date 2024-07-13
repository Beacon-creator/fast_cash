using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Model;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
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
            var token = _tokenService.GetToken();
           // Console.WriteLine($"token: {token}");
            if (!string.IsNullOrEmpty(token))
            {
                Email = _jwtService.GetEmailFromToken(token);
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
                    await _alertService.ShowAlertAsync("Success", $"Verification successful: {verificationCode}.", "OK");
                    await Shell.Current.GoToAsync("CardLinkSuccess");
                }
                else
                {
                    var errorResponse = await response.Content.ReadAsStringAsync();
                    await _alertService.ShowAlertAsync("Error", $"Invalid or expired verification code. Server response: {errorResponse}", "OK");
                }
            }
            catch (HttpRequestException ex)
            {
                await _alertService.ShowAlertAsync("Error", $"Request error: {ex.Message}", "OK");
            }
            catch (Exception ex)
            {
                await _alertService.ShowAlertAsync("Error", $"An error occurred: {ex.Message}", "OK");
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
                    var verificationCode = await response.Content.ReadAsStringAsync();
                    await _alertService.ShowAlertAsync("Success", $"Verification code resent: {verificationCode}", "OK");
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Failed to send verification code", "OK");
                }
            }
            catch (Exception ex)
            {
                await _alertService.ShowAlertAsync("Error", $"Failed to send verification code: {ex.Message}", "OK");
                throw;
            }
        }



        [RelayCommand]
        private async Task Cancel()
        {
            var appShell = (AppShell)Application.Current.MainPage;
            await appShell.NavigateToHomeScreen();
        }
    }
}
