namespace Cashnal.Pages.TabbedPages;

public partial class FacescanPage : ContentPage
{
	public FacescanPage()
	{
		InitializeComponent();

        // Set the API key after initialization
        CardScannerComponent.ApiKey = "your-api-key";
        }
}