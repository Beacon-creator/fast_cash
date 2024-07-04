using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Microsoft.Maui;
using Fast_Cash.ViewModels;
using Fast_Cash.EventHandlers;

namespace Fast_Cash.Pages
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class ForgotPasswordVerificationPage : ContentPage
	{
		public ForgotPasswordVerificationPage ()
		{
            InitializeComponent();

            // Resolve the ViewModel from the ServiceProviderHelper
            BindingContext = ServiceProviderHelper.GetService<ForgotPasswordVerificationViewModel>();
        }

        private void OnCodeEntryCompleted(object sender, EventArgs e)
        {
            if ( sender == CodeEntryOne) 
            {
                CodeEntryTwo.Focus(); 
            }
            else if (sender == CodeEntryTwo )
            {
                CodeEntryThree.Focus();
            }
            else if (sender == CodeEntryThree)
            {
                CodeEntryFour.Focus();
            }
            else if (sender == CodeEntryFour)
            {
                CodeEntryFive.Focus();
            }
            else if (sender == CodeEntryFive)
            {
                CodeEntrySix.Focus();
            }
            else if (sender == CodeEntrySix)
            {
                IsBusy = true; // show the spinner
                var viewModel = BindingContext as ForgotPasswordVerificationViewModel;
                if (viewModel != null)
                {
                    viewModel.VerificationCode = $"{CodeEntryOne.Text}{CodeEntryTwo.Text}{CodeEntryThree.Text}{CodeEntryFour.Text}{CodeEntryFive.Text}{CodeEntrySix.Text}";
                    viewModel.VerifyCodeCommand.Execute(null);
                   
                }
                IsBusy = false; // hide the spinner
            }


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