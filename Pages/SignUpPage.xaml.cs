using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Cashnal.ViewModels;
using Cashnal.EventHandlers;

namespace Cashnal.Pages
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class SignUpPage : ContentPage
    {
        public SignUpPage()
        {
            InitializeComponent();

            // Resolve the ViewModel from the ServiceProviderHelper
            BindingContext = ServiceProviderHelper.GetService<SignUpViewModel>();
        }
    }
}
