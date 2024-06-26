using System;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Microsoft.Maui;

namespace Fast_Cash.Custom_Render;

public partial class TopNav : ContentView
{
    public static readonly BindableProperty HeaderProperty =
       BindableProperty.Create(nameof(Header), typeof(string), typeof(TopNav));


    public string Header
    {
        get => (string)GetValue(HeaderProperty);
        set => SetValue(HeaderProperty, value);
    }
    public TopNav()
	{
		InitializeComponent();
        BindingContext = this;
	}

    private async void BackButton_Clicked(object sender, EventArgs e)
    {
        try
        {
            if (Shell.Current.Navigation.NavigationStack.Count > 1)
            {
                Console.WriteLine("tis clicked");
                await Shell.Current.Navigation.PopAsync();
            }
            else
            {
                Console.WriteLine("Here clicked");
                await Shell.Current.GoToAsync("..");

             //   await Navigation.PopAsync();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Navigation error: {ex.Message}");
            // Fallback to a known absolute path
            await Shell.Current.GoToAsync("//HomePage");
        }
    }
}

