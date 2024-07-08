using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Microsoft.Maui;
using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;

namespace Fast_Cash.Pages
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class NewPasswordPage : ContentPage
	{
		public NewPasswordPage ()
		{
			InitializeComponent ();

            // Resolve the ViewModel from the ServiceProviderHelper
            BindingContext = ServiceProviderHelper.GetService<NewPasswordViewModel>();
        }

    }
}