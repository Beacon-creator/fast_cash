using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class SignUpViewModel : ObservableObject
    {
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

        [RelayCommand]
        private async Task SignUp()
        {
            // Handle sign-up logic here
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
