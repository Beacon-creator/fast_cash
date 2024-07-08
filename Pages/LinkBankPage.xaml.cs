// Pages/LinkBankPage.xaml.cs
using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;

namespace Fast_Cash.Pages
{
    public partial class LinkBankPage : ContentPage
    {
        public LinkBankPage()
        {
            InitializeComponent();
            // Resolve the ViewModel from the ServiceProviderHelper
            BindingContext = ServiceProviderHelper.GetService<LinkBankViewModel>();
        }
    }
}
