// Pages/BankVerificationPage.xaml.cs
using CommunityToolkit.Maui.Views;
using Cashnal.EventHandlers;
using Cashnal.ViewModels;

namespace Cashnal.Pages
{
    public partial class BankVerificationPage : ContentPage
    {
        public BankVerificationPage()
        {
            InitializeComponent();
            BindingContext = ServiceProviderHelper.GetService<BankVerificationViewModel>();
        }

        private void TapGestureRecognizer_GetCall(object sender, TappedEventArgs e)
        {

        }
    }
}
