using CommunityToolkit.Maui.Views;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;
using Microsoft.Maui.Controls;

namespace Fast_Cash.Pages.TabbedPages;

[QueryProperty(nameof(Email), "email")]
public partial class HomePage : ContentPage
    {
    private string email;
    private Popup _popupInstance;
    public string Email
        {
        get => email;
        set
            {
            email = value;
            OnPropertyChanged(nameof(Email));
            var viewModel = BindingContext as HomePageVM;
            if (viewModel != null)
                {
                viewModel.Email = email;
                }
            }
        }

    public HomePage()
        {
        InitializeComponent();
        BindingContext = ServiceProviderHelper.GetService<HomePageVM>();
        }

    public void ShowDropdown()
        {
        Console.WriteLine("You clicked me here");

        var logoutButton = new Button
            {
            Text = "Logout",
            Command = new Command(async () =>
            {
                _popupInstance.Close();
                var command = ((HomePageVM)BindingContext).OnLogoutCommand as AsyncRelayCommand;
                if (command != null)
                    {
                    await command.ExecuteAsync(null);
                    }
            })
            };

        var deleteAccountButton = new Button
            {
            Text = "Delete Account",
            Command = new Command(async () =>
            {
                _popupInstance.Close();
                var command = ((HomePageVM)BindingContext).OnDeleteAccountCommand as AsyncRelayCommand;
                if (command != null)
                    {
                    await command.ExecuteAsync(null);
                    }
            })
            };

        var closeButton = new Button { Text = "Close", Command = new Command(ClosePopup) };

        var popupContent = new StackLayout
            {
            BackgroundColor = Colors.White,
            Padding = 10,
            Spacing = 10,
            Children =
                {
                    logoutButton,
                    deleteAccountButton,
                    closeButton
                }
            };

        _popupInstance = new Popup
            {
            Content = popupContent
            };

        this.ShowPopup(_popupInstance);  // Use the extension method
        }

    private void ClosePopup()
        {
        _popupInstance?.Close();
        }
    }
