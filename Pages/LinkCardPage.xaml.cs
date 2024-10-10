using Cashnal.EventHandlers;
using Cashnal.ViewModels;

namespace Cashnal.Pages;

public partial class LinkCardPage : ContentPage
{
	public LinkCardPage()
	{
		InitializeComponent();
        // Resolve the ViewModel from the ServiceProviderHelper
        BindingContext = ServiceProviderHelper.GetService<LinkCardViewModel>();
    }

}