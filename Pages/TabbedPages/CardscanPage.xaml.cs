namespace Cashnal.Pages.TabbedPages;

public partial class CardscanPage : ContentPage
{
	public CardscanPage()
	{
		InitializeComponent();

        // Set the API key after initialization
        CardScannerComponent.ApiKey = "your-api-key";
        }
}