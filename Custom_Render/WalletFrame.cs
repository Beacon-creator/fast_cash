using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fast_Cash.Custom_Render
{
   public class WalletFrame : ImageButton
    {
        public static readonly BindableProperty RouteProperty =
            BindableProperty.Create(nameof(Route), typeof(string), typeof(WalletFrame), "");


        public string Route
        {
            get => (string)GetValue(RouteProperty);
            set => SetValue(RouteProperty, value);
         }

        public WalletFrame()
        {
            Clicked += WalletFrame_Clicked;
        }

        private async void WalletFrame_Clicked(object sender, EventArgs e)
        {
           await Shell.Current.GoToAsync(Route);

           
        }
    }
  
}
