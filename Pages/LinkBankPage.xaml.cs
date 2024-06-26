namespace Fast_Cash.Pages;

public partial class LinkBankPage : ContentPage
{
	public LinkBankPage()
	{
		InitializeComponent();
	}

    private async void ContinuebutClicked(object sender, EventArgs e)
    {
       await Shell.Current.GoToAsync("///BankVerificationPage");

       //   await Shell.Current.GoToAsync(nameof(BankVerificationPage));

        //  await Navigation.PushAsync(new BankVerificationPage());
    }
}