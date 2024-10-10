using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;

namespace Cashnal.ViewModels
    {
    public partial class ConfirmationDialogViewModel : ObservableObject
        {
        private readonly HomePageVM _homePageVM;

        public ConfirmationDialogViewModel(HomePageVM homePageVM)
            {
            _homePageVM = homePageVM;
            }

        [RelayCommand]
        private async Task Cancel()
            {
            await Application.Current.MainPage.Navigation.PopModalAsync();
            }

        [RelayCommand]
        private async Task Delete()
            {
            await _homePageVM.ConfirmDeleteAccount();
            await Application.Current.MainPage.Navigation.PopModalAsync();
            }
        }
    }
