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
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;
        private readonly TokenService _tokenService;
        private readonly JwtService _jwtService;


        [ObservableProperty]
        private ImageSource profileImage;

        [ObservableProperty]
        private bool isBusy;

        [ObservableProperty]
        private string email;

        [ObservableProperty]
        private string greetingMessage;
        public HomePageVM(HttpClient httpClient, IAlertService alertService, TokenService tokenService, JwtService jwtService)
            {
            _httpClient = httpClient;
            _alertService = alertService;
            _tokenService = tokenService;
            _jwtService = jwtService;


            SetGreetingMessage();


            if (_httpClient.BaseAddress == null)
                {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
                }

           // Initialize();
            }


        private void Initialize()
            {
            var token = _tokenService.GetToken();
            if (!string.IsNullOrEmpty(token))
                {
                Email = _jwtService.GetEmailFromToken(token);
                if (string.IsNullOrEmpty(Email))
                    {
                    _alertService.ShowAlertAsync("Error", "Invalid token format or missing email claim.", "OK");
                    }
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
                var response = await _httpClient.PostAsync("api/User/Logout", null);
                if (response.IsSuccessStatusCode)
                    {
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
                await _alertService.ShowAlertAsync("Network error", "Try again later.", "OK");
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
                var response = await _httpClient.DeleteAsync("api/User/DeleteAccount");
                if (response.IsSuccessStatusCode)
                    {
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

        private void SetGreetingMessage()
            {
            var currentHour = DateTime.Now.Hour;

            if (currentHour >= 0 && currentHour < 12)
                {
                GreetingMessage = "Good morning!";
                }
            else if (currentHour >= 12 && currentHour < 18)
                {
                GreetingMessage = "Good afternoon!";
                }
            else
                {
                GreetingMessage = "Good evening!";
                }
            }

        [RelayCommand]
        private async Task SelectProfilePicture()
            {
            try
                {
                var result = await MediaPicker.PickPhotoAsync();
                if (result != null)
                    {
                    var stream = await result.OpenReadAsync();
                    ProfileImage = ImageSource.FromStream(() => stream);
                    }
                }
            catch (FeatureNotSupportedException fnsEx)
                {
                // Handle not supported on device exception
                }
            catch (PermissionException pEx)
                {
                // Handle permission exception
                }
            catch (Exception ex)
                {
                // Handle other exceptions
                }
            }
        public AsyncRelayCommand OnLogoutCommand => new AsyncRelayCommand(OnLogout);
        public AsyncRelayCommand OnDeleteAccountCommand => new AsyncRelayCommand(OnDeleteAccount);
        }
    }
