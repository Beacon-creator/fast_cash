using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Microsoft.Maui;

namespace Fast_Cash.Pages
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ForgotPasswordPage : ContentPage
	{
		public ForgotPasswordPage ()
		{
			InitializeComponent ();
		}

      async private void ForgotbutNext(object sender, EventArgs e)
        {
         //   await Shell.Current.GoToAsync("///ForgotPasswordPage");

            await Shell.Current.GoToAsync(nameof(ForgotPasswordPage));
        }

        private async void backbut_Clicked(object sender, EventArgs e)
        {
            // await Navigation.PopAsync();
        }
    }
}