using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;

namespace Fast_Cash.Pages;

public partial class LinkCardPage : ContentPage
{
	public LinkCardPage()
	{
		InitializeComponent();
        // Resolve the ViewModel from the ServiceProviderHelper
        BindingContext = ServiceProviderHelper.GetService<LinkCardViewModel>();
    }

}