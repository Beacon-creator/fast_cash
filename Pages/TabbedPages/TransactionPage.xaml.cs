using Cashnal.EventHandlers;
using Cashnal.ViewModels;
using Microsoft.Maui.Controls;

namespace Cashnal.Pages.TabbedPages
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
