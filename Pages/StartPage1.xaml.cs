using System.Collections.ObjectModel;
using System;
using Fast_Cash.ViewModels;
using Microsoft.Maui.Controls.Xaml;
using System.Collections.Generic;
using Microsoft.Maui.Controls;
using Microsoft.Maui;

namespace Fast_Cash.Pages
{
    public partial class StartPage1 : ContentPage
    {
        public StartPage1()
        {
            InitializeComponent();
            BindingContext = new StartPageViewModel();

         //   carouselView.ItemsSource = carouselItems;

        }

    //    private List<CarouselItem> carouselItems = new List<CarouselItem>
    //{
    //    new CarouselItem { ImageUrl = "IMG1.png", Text = "Quick and Easy", Text2 = "Just visit any of the growing number of outlets " +
    //        "who accepts money and make purchases within seconds"  },
    //    new CarouselItem { ImageUrl = "IMG3.png", Text = "Investment Effectiveness", Text2 = "We constantly update our currency markets and exchange rates"},
    //    new CarouselItem { ImageUrl = "IMG2.png", Text = "Security", Text2 = "Your money is safe and secure with us and protected by your login" },
    //    // Add more items as needed
    //};

    //    //private async void Getstartedbut_Clicked(object sender, EventArgs e)
    //    //{
    //    //    await Navigation.PushAsync(new SignInPage());
    //    //}
    }
}