namespace Fast_Cash.Pages;

public partial class LinkCardPage : ContentPage
{
	public LinkCardPage()
	{
		InitializeComponent();
	}

    private async void LinkCardbut(object sender, EventArgs e)
    {
        await DisplayAlert("Success", "Card linked successfully!", "OK");
    }
}