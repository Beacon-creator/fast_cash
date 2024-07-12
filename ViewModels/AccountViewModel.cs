using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.Pages;
using Fast_Cash.Pages.TabbedPages;
using Microsoft.Maui.Controls;
using System.Threading.Tasks;

namespace Fast_Cash.ViewModels
{
    public partial class AccountViewModel : ObservableObject
    {
        public AccountViewModel()
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

        //[RelayCommand]
        //public async Task LinkCardLater()
        //{
        //    var appShell = (AppShell)Application.Current.MainPage;

        //    await appShell.NavigateToHomeScreen();
        //}

        [RelayCommand]
        public async Task BankOneClicked()
        {
            await Shell.Current.GoToAsync("/LinkBankPage");

         //   await Shell.Current.GoToAsync(nameof(LinkBankPage));
        }

        [RelayCommand]
        public async Task CardOneClicked()
        {
               await Shell.Current.GoToAsync("///LinkCardPage");

          //  await Shell.Current.GoToAsync(nameof(LinkCardPage));

        }
    }
}
