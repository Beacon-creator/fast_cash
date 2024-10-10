using Cashnal.EventHandlers;
using Cashnal.ViewModels;
using Microsoft.Maui.Controls;

namespace Cashnal.Pages
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
