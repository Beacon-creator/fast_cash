// Pages/LinkBankPage.xaml.cs
using Cashnal.EventHandlers;
using Cashnal.ViewModels;

namespace Cashnal.Pages
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
