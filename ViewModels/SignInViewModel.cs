using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Pages;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class SignInViewModel : ObservableObject
    {
        private readonly IAlertService _alertService;

        public SignInViewModel(IAlertService alertService)
        {
            _alertService = alertService;
        }

        [ObservableProperty]
        private string? emailOrPhone;

        [ObservableProperty]
        private string? password;

        [RelayCommand]
        private async Task SignIn()
        {
            // Handle sign-in logic here
            //  await Shell.Current.GoToAsync("//HomePage");
            var appShell = (AppShell)Application.Current.MainPage;

            await appShell.NavigateToHomeScreen();

            // Handle sign-in logic here
            //bool loginSuccessful = true; // Replace with actual login logic

            //if (loginSuccessful)
            //{
            //    // Navigate to the main page (TabBar)
            //    var appShell = (AppShell)Application.Current.MainPage;
            //    await appShell.NavigateToHomeScreen();
            //}
            //else
            //{
            //    // Handle login failure
            //    await _alertService.ShowAlertAsync("Login Failed", "Invalid credentials, please try again.", "OK");
            //}
        }


        [RelayCommand]
        private async Task NavigateToForgotPassword()
        {
            // Navigate to the forgot password page
            await Shell.Current.GoToAsync("//ForgotPasswordPage");
        }

        [RelayCommand]
        private async Task NavigateToSignUp()
        {
            // Navigate to the sign-up page
            await Shell.Current.GoToAsync("//SignUpPage");
        }

        [RelayCommand]
        private void GoogleSignIn()
        {
            // Handle Google sign-in logic here
        }

        [RelayCommand]
        private void MicrosoftSignIn()
        {
            // Handle Microsoft sign-in logic here
        }
    }
}
