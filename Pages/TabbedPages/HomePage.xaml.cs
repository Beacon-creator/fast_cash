using Fast_Cash.ViewModels;
using Fast_Cash.EventHandlers;

namespace Fast_Cash.Pages.TabbedPages;

public partial class HomePage : ContentPage
{
	public HomePage()
	{
		InitializeComponent();


        // Resolve the ViewModel from the ServiceProviderHelper
        BindingContext = ServiceProviderHelper.GetService<HomePageVM>();
    }
}