using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;
using Microsoft.Maui.Controls;

namespace Fast_Cash.Pages.TabbedPages
{
    public partial class TransactionPage : ContentPage
    {
        public TransactionPage()
        {
            InitializeComponent();

            BindingContext = ServiceProviderHelper.GetService<TransactionPageViewModel>();
        }

    }
}
