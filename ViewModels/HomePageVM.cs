using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.Custom_Render;
using Fast_Cash.EventHandlers;
using Fast_Cash.Pages;
using System.Net.Http.Json;
using System.Threading.Tasks;
using System.Linq;

namespace Fast_Cash.ViewModels
{
    public partial class HomePageVM : ObservableObject
    {
        private readonly HttpClientService _httpClientService;
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private bool isBusy;

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
            IsBusy = true;
            try
            {
                var response = await _httpClientService.PostAsync("api/User/Logout", null);
                if (response.IsSuccessStatusCode)
                {
                    System.Diagnostics.Debug.WriteLine("Logout successful.");
                    await ClosePopup(); // Close the popup
                    await Shell.Current.GoToAsync("//LoginPage"); // Use absolute URI to clear the navigation stack
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Failed to logout. Please try again later.", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                await _alertService.ShowAlertAsync("Error", $"A connection error occurred: {httpEx.Message}", "OK");
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
            IsBusy = true;
            try
            {
                var response = await _httpClientService.DeleteAsync("api/User/DeleteAccount");
                if (response.IsSuccessStatusCode)
                {
                    System.Diagnostics.Debug.WriteLine("Account deletion successful.");
                    await ClosePopup(); // Close the popup
                    await Shell.Current.GoToAsync("//SignupPage");
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", "Failed to delete account. Please try again later.", "OK");
                }
            }
            catch (HttpRequestException httpEx)
            {
                await _alertService.ShowAlertAsync("Error", $"A connection error occurred: {httpEx.Message}", "OK");
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
        private async Task ClosePopup()
        {
            var popup = Shell.Current.Navigation.ModalStack.OfType<OptionsPopup>().FirstOrDefault();
            popup?.Close();
        }

        public IRelayCommand OnLogoutCommand => new AsyncRelayCommand(OnLogout);
        public IRelayCommand OnDeleteAccountCommand => new AsyncRelayCommand(OnDeleteAccount);
    }
}
