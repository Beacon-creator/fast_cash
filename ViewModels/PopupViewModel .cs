using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Windows.Input;

namespace Fast_Cash.ViewModels
{
    public partial class PopupViewModel : ObservableObject
    {
        [ObservableProperty]
        private bool isPopupVisible;

        [RelayCommand]
        private void ShowPopup()
        {
            IsPopupVisible = true;
        }

        [RelayCommand]
        private void HidePopup()
        {
            IsPopupVisible = false;
        }
    }
}
