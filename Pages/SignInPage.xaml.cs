using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;
using Microsoft.Maui.Controls;

namespace Fast_Cash.Pages
{
    public partial class SignInPage : ContentPage
    {
        public SignInPage()
        {
            InitializeComponent();

            // Resolve the ViewModel from the ServiceProviderHelper
            BindingContext = ServiceProviderHelper.GetService<SignInViewModel>();
        }
    }
}
