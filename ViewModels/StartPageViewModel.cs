using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using Fast_Cash.Pages;

namespace Fast_Cash.ViewModels
{
    public class CarouselItem
    {
        public string? ImageUrl { get; set; }
       
        public string? Text { get; set; }
        
        public string? Text2 { get; set; }

        public Color? IndicatorColor { get; set; } // Add this property
     
    }

    public partial class StartPageViewModel : ObservableObject
    {
        public List<CarouselItem> CarouselItems { get; set; }

        public StartPageViewModel()
        {
            CarouselItems = new List<CarouselItem>
            {
                new CarouselItem { ImageUrl = "Img1.png", Text = "Quick and Easy", Text2 = "Just visit any of the growing number of outlets who accepts money and make purchases within seconds"  },
                new CarouselItem { ImageUrl = "Img2.png", Text = "Investment Effectiveness", Text2 = "We constantly update our currency markets and exchange rates"},
                new CarouselItem { ImageUrl = "Img2.png", Text = "Security", Text2 = "Your money is safe and secure with us and protected by your login" },
            };
        }

        [RelayCommand]
        private async Task GetStarted()
        {
            // await Shell.Current.GoToAsync("//SignUpPage");

            await Shell.Current.GoToAsync(nameof(SignUpPage));
        }
    }
}