using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Microsoft.Maui;
using System.Windows.Input;

namespace Fast_Cash.Custom_Render;

public partial class BankCard : ContentView
{
    // Define Commands
    public static readonly BindableProperty NavigationCommandProperty = BindableProperty.Create(
     nameof(NavigationCommand),
    typeof(ICommand),
    typeof(BankCard),
    null);

    public ICommand NavigationCommand
    {
        get => (ICommand)GetValue(NavigationCommandProperty);
        set => SetValue(NavigationCommandProperty, value);
    }


    public static readonly BindableProperty BackgroundImageSourceProperty = BindableProperty.Create(
        nameof(BackgroundImageSource),
        typeof(string),
        typeof(BankCard),
        null,
        propertyChanged: (bindable, oldValue, newValue) =>
        {
            ((BankCard)bindable).backgroundImage.Source = (string)newValue;
        });

    public string BackgroundImageSource
    {
        get { return (string)GetValue(BackgroundImageSourceProperty); }
        set { SetValue(BackgroundImageSourceProperty, value); }
    }

    public BankCard()
	{
		InitializeComponent();

        backgroundImage.GestureRecognizers.Add(new TapGestureRecognizer
        {
            Command = new Command(() => HandleNavigation()),
        });

	}

    // Handle navigation
    private void HandleNavigation()
    {
        if (NavigationCommand != null && NavigationCommand.CanExecute(null))
            NavigationCommand.Execute(null);
    }

}