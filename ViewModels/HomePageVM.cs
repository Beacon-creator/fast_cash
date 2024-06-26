using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.Pages;

namespace Fast_Cash.ViewModels;

public partial class HomePageVM : ObservableObject
{

    [RelayCommand]
    async Task Tap(string s)
    {
        await Shell.Current.GoToAsync(nameof(SignInPage));
    }

}
