using Cashnal.Pages.TabbedPages;

namespace Cashnal.Pages;

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