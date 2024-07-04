using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using Fast_Cash.EventHandlers;
namespace Fast_Cash.ViewModels
{
    public partial class NewPasswordViewModel : ObservableObject, IQueryAttributable
    {
        private readonly HttpClient _httpClient;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? email;

        [ObservableProperty]
        private string? password;

        [ObservableProperty]
        private string? confirmPassword;

        [ObservableProperty]
        private bool isBusy;
        public NewPasswordViewModel(HttpClient httpClient, IAlertService alertService)
        {
            _httpClient = httpClient;
            _alertService = alertService;

            // Set the base address if it is not already set
            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
            }
        }

        public void ApplyQueryAttributes(IDictionary<string, object> query)
        {
            if (query.ContainsKey("email"))
            {
                Email = query["email"].ToString();
            }
        }

        [RelayCommand]
        private async Task ResetPassword()
        {

            if (Password != ConfirmPassword)
            {
                await _alertService.ShowAlertAsync("Error", "Passwords do not match.", "OK");
                return;
            }
            IsBusy = true; // show the spinner
            var resetPasswordModel = new { Email, Password, Code = "" }; // Add the verification code if needed
            var response = await _httpClient.PostAsJsonAsync("api/PasswordReset/reset-password", resetPasswordModel);
            if (response.IsSuccessStatusCode)
            {
                await _alertService.ShowAlertAsync("Success", "Password has been reset successfully.", "OK");
                await Shell.Current.GoToAsync("//SignInPage");
            }
            else
            {
                IsBusy = false; // hide the spinner
                await _alertService.ShowAlertAsync("Error", "Failed to reset password.", "OK");
            }

            IsBusy = false; // hide the spinner
        }
    }
}
