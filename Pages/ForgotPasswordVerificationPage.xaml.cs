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
	public partial class ForgotPasswordVerificationPage : ContentPage
	{
		public ForgotPasswordVerificationPage ()
		{
			InitializeComponent ();
		}

        private void TapGestureRecognizer_Resend(object sender, EventArgs e)
        {

        }

        async private void ForgotbutNext(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new NewPasswordPage());
        }

        private async void backbut_Clicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }
    }
}