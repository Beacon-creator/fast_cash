using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Pages;
using System.Threading.Tasks;

namespace Fast_Cash.ViewModels
{
    public partial class HomePageVM : ObservableObject
    {
        private readonly HttpClientService _httpClientService;
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;

        public HomePageVM(HttpClient httpClient, HttpClientService httpClientService, IAlertService alertService)
        {
            _httpClientService = httpClientService;
            _httpClient = httpClient;
            _alertService = alertService;

            // Ensure BaseAddress is set only once and not modified later
            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
            }
        }

        [RelayCommand]
        async Task Tap(string s)
        {
            await Shell.Current.GoToAsync(nameof(SignInPage));
        }

        [RelayCommand]
        private async Task Qrcode()
        {
            var appShell = (AppShell)Application.Current.MainPage;
            await appShell.NavigateToQRscreen();
        }

        [RelayCommand]
        private async Task Dot()
        {
            var popup = new Custom_Render.OptionsPopup
            {
                BindingContext = this
            };
            Application.Current.MainPage.ShowPopup(popup);
        }

        [RelayCommand]
        private async Task OnLogout()
        {
            try
            {
                var response = await _httpClientService.PostAsync("api/Users/Logout", null);
                if (response.IsSuccessStatusCode)
                {
                    await Shell.Current.GoToAsync(nameof(SignInPage));
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Failed to logout. Please try again later.", "OK");
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
        }

        [RelayCommand]
        private async Task OnDeleteAccount()
        {
            bool answer = await Application.Current.MainPage.DisplayAlert("Confirm Delete", "Are you sure you want to delete your account?", "Yes", "No");

            if (answer)
            {
                await ConfirmDeleteAccount();
            }
        }

        internal async Task ConfirmDeleteAccount()
        {
            try
            {
                var response = await _httpClientService.DeleteAsync("api/Users/DeleteAccount");
                if (response.IsSuccessStatusCode)
                {
                    await Shell.Current.GoToAsync(nameof(SignUpPage));
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Failed to delete account. Please try again later.", "OK");
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
        }
    }
}
