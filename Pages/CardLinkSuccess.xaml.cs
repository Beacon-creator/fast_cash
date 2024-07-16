using Fast_Cash.Pages.TabbedPages;

namespace Fast_Cash.Pages;

public partial class CardLinkSuccess : ContentPage
{
	public CardLinkSuccess()
	{
		InitializeComponent();
	}
    private async void Home_Clicked(object sender, EventArgs e)
    {
        var appShell = (AppShell)Application.Current.MainPage;

        await appShell.NavigateToHome();
    }
}