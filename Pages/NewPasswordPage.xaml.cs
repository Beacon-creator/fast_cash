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
	public partial class NewPasswordPage : ContentPage
	{
		public NewPasswordPage ()
		{
			InitializeComponent ();
		}

        private void ForgotbutNext(object sender, EventArgs e)
        {

        }

        private async void backbut_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }
    }
}