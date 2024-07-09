using CommunityToolkit.Maui.Views;
using Fast_Cash.EventHandlers;
using Fast_Cash.ViewModels;

namespace Fast_Cash.Custom_Render
{
    public partial class OptionsPopup : Popup
    {
        public OptionsPopup()
        {
            InitializeComponent();
            BindingContext = ServiceProviderHelper.GetService<HomePageVM>();
        }
    }
}
