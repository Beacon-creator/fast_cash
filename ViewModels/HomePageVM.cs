using System;
using System.Net.Http;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using Fast_Cash.Custom_Render;
using Fast_Cash.EventHandlers;
using Fast_Cash.Pages;
using Fast_Cash.Pages.TabbedPages;

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
        private async Task OnLogout()
            {
            IsBusy = true;
            try
                {
                IsBusy = true;
                var response = await _httpClientService.PostAsync("api/User/Logout", null);
                if (response.IsSuccessStatusCode)
                    {
                    IsBusy = false;
                    await _alertService.ShowAlertAsync("Successful", "Logout successful.", "OK");
                    await Shell.Current.GoToAsync("//LoginPage");
                    }
                else
                    {
                    await _alertService.ShowAlertAsync("Error", "Failed to logout. Please try again later.", "OK");
                    }
                }
            catch (HttpRequestException httpEx)
                {
                await _alertService.ShowAlertAsync("Network error", "Try again later,", "OK");
                }
            catch (Exception ex)
                {
                await _alertService.ShowAlertAsync("Error", "An error occurred", "OK");
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
                    IsBusy = false;
                    await _alertService.ShowAlertAsync("Successful", "Account deleted successfully.", "OK");
                    await Shell.Current.GoToAsync("//LogupPage");
                    }
                else
                    {
                    await _alertService.ShowAlertAsync("Error", "Failed to delete account. Please try again later.", "OK");
                    }
                }
            catch (HttpRequestException httpEx)
                {
                await _alertService.ShowAlertAsync("Error", "A connection error occurred", "OK");
                }
            catch (Exception ex)
                {
                await _alertService.ShowAlertAsync("Error", "An error occurred", "OK");
                }
            finally
                {
                IsBusy = false;
                }
            }

        [RelayCommand]
        private void ShowDropdown()
            {
            var currentPage = Shell.Current.CurrentPage;

            if (currentPage is HomePage homePage)
                {
                homePage.ShowDropdown();
                }
            else
                {
                Console.WriteLine("HomePage instance not found");
                }
            }

        public AsyncRelayCommand OnLogoutCommand => new AsyncRelayCommand(OnLogout);
        public AsyncRelayCommand OnDeleteAccountCommand => new AsyncRelayCommand(OnDeleteAccount);
        }
    }
