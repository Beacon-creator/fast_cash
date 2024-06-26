using CommunityToolkit.Maui.Views;

namespace Fast_Cash.Pages;

public partial class BankVerificationPage : ContentPage
{
	public BankVerificationPage()
	{
		InitializeComponent();
	}

    private async void LinkCard(object sender, EventArgs e)
    {
     //   await Shell.Current.GoToAsync("///CardLinkSuccess");

        await Shell.Current.GoToAsync(nameof(CardLinkSuccess));
    }

    private void TapGestureRecognizer_GetCall(object sender, TappedEventArgs e)
    {

    }

    private void TapGestureRecognizer_Check(object sender, TappedEventArgs e)
    {

    }

    private async void TapGestureRecognizer_Cancel(object sender, TappedEventArgs e)
    {
        var appShell = (AppShell)Application.Current.MainPage;

        await appShell.NavigateToHomeScreen();

        //  await Shell.Current.GoToAsync("LinkBankPage");

        // await Shell.Current.GoToAsync(nameof(LinkBankPage));
    }

    //private async void backbut_Clicked(object sender, EventArgs e)
    //{
    //    await Navigation.PopAsync();
    //}
}