using System;
using System.Net.Http;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using Cashnal.Custom_Render;
using Cashnal.Pages;
using Cashnal.Pages.TabbedPages;
using Cashnal.EventHandlers;

namespace Cashnal.ViewModels
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
                _httpClient.BaseAddress = new Uri("https://grabbyfanalapi.onrender.com/");
                }

           // Initialize();
            }


        private void Initialize()
            {
            var token = TokenService.GetToken();
            if (!string.IsNullOrEmpty(token))
                {
                Email = JwtService.GetEmailFromToken(token);
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
                var response = await _httpClient.PostAsync("api/users/logout", null);
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
            catch (HttpRequestException)
                {
                
                await _alertService.ShowAlertAsync("Network error", "Try again later.", "OK");
                }
            catch (Exception)
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
                var response = await _httpClient.DeleteAsync("api/users/deleteAccount");
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
            catch (HttpRequestException)
                {
                await _alertService.ShowAlertAsync("Error", "A connection error occurred, try again", "OK");
                }
            catch (Exception)
                {
                await _alertService.ShowAlertAsync("Error", "Please try again", "OK");
                }
            finally
                {
                IsBusy = false;
                }
            }

        [RelayCommand]
        private static void ShowDropdown()
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
            catch (FeatureNotSupportedException)
                {
                //  Console.WriteLine(fnsEx);
                await _alertService.ShowAlertAsync("Error", "A connection error occurred, try again", "OK");
                }
            catch (PermissionException)
                {
                // Console.WriteLine(pEx);
                await _alertService.ShowAlertAsync("Error", "A connection error occurred, try again", "OK");
                }
            catch (Exception)
                {
               
                }
            }
        public AsyncRelayCommand OnLogoutCommand => new(OnLogout);
        public AsyncRelayCommand OnDeleteAccountCommand => new(OnDeleteAccount);
        }
    }
