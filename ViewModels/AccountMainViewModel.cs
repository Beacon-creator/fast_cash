using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Cashnal.Pages;
using Cashnal.Pages.TabbedPages;
using Microsoft.Maui.Controls;
using System.Threading.Tasks;

namespace Cashnal.ViewModels
{
    public partial class AccountMainViewModel : ObservableObject
    {
        public AccountMainViewModel()
        {
            BatchAVisible = true; // Initialize to show Batch A first
        }

        [ObservableProperty]
        private bool batchAVisible;

        [ObservableProperty]
        private bool batchBVisible;

        [RelayCommand]
        public void ToggleBatches()
        {
            BatchAVisible = !BatchAVisible;
            BatchBVisible = !BatchBVisible;
        }

        [RelayCommand]
        public async Task LinkCardLater()
        {
            var appShell = (AppShell)Application.Current.MainPage;

            await appShell.NavigateToHome();
        }

        [RelayCommand]
        public async Task BankOneClicked()
        {
           await Shell.Current.GoToAsync("///AccountPageMain//LinkBankPage");

            //   await Shell.Current.GoToAsync(nameof(LinkBankPage));
        }

        [RelayCommand]
        public async Task CardOneClicked()
        {
            await Shell.Current.GoToAsync("///AccountPageMain//LinkCardPage");
            //  await Shell.Current.GoToAsync(nameof(LinkCardPage));

        }
    }
}
