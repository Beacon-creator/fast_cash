using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.Model;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class SignUpViewModel : ObservableObject
    {
        private readonly HttpClient _httpClient;

        [ObservableProperty]
        private string? phoneNumber;

        [ObservableProperty]
        private string? emailAddress;

        [ObservableProperty]
        private string? password;

        [ObservableProperty]
        private string? confirmPassword;

        [ObservableProperty]
        private bool termsAccepted;

        public SignUpViewModel()
        {
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/api/signup")
            };
        }

        [RelayCommand]
        private async Task SignUp()
        {
            if (string.IsNullOrEmpty(EmailAddress) || string.IsNullOrEmpty(Password) || string.IsNullOrEmpty(ConfirmPassword) || string.IsNullOrEmpty(PhoneNumber))
            {
                // Handle validation error
                await Application.Current.MainPage.DisplayAlert("Error", "All fields are required", "OK");
                return;
            }

            if (Password != ConfirmPassword)
            {
                // Handle password mismatch
                await Application.Current.MainPage.DisplayAlert("Error", "Passwords do not match", "OK");
                return;
            }

            var signupModel = new SignupModel
            {
                Email = EmailAddress,
                Password = Password,
                Phonenumber = PhoneNumber
            };

            var response = await _httpClient.PostAsJsonAsync("Signup", signupModel);

            if (response.IsSuccessStatusCode)
            {
                // Handle successful signup
                await Application.Current.MainPage.DisplayAlert("Success", "Account created successfully", "OK");
                // Navigate to the sign-in page
                await Shell.Current.GoToAsync("//SignInPage");
            }
            else
            {
                // Handle signup error
                var errorMessage = await response.Content.ReadAsStringAsync();
                await Application.Current.MainPage.DisplayAlert("Error", errorMessage, "OK");
            }
        }

        [RelayCommand]
        private async Task SignIn()
        {
            // Navigate to the sign-in page
            await Shell.Current.GoToAsync("//SignInPage");
        }

        [RelayCommand]
        private void GoogleSignUp()
        {
            // Handle Google sign-up logic here
        }

        [RelayCommand]
        private void MicrosoftSignUp()
        {
            // Handle Microsoft sign-up logic here
        }

        [RelayCommand]
        private void RulesTapped()
        {
            // Handle rules tapped logic here
        }

        [RelayCommand]
        private void TermsAcceptedChanged()
        {
            // Handle terms accepted changed logic here
        }
    }
}
