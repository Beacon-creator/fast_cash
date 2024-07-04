using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Fast_Cash.ViewModels;
using Fast_Cash.EventHandlers;

namespace Fast_Cash.Pages
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
