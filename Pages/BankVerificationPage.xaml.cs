// Pages/BankVerificationPage.xaml.cs
using CommunityToolkit.Maui.Views;
using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;

namespace Fast_Cash.Pages
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
