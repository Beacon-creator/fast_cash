using Microsoft.Maui.Controls;

namespace Cashnal.Custom_Render;

public partial class SearchFrame : ContentView
{
	public SearchFrame()
	{
		InitializeComponent();
	}

    private void OnSearchClicked(object sender, EventArgs e)
    {
        // Handle the search icon click event
        var searchText = searchEntry.Text;
        // Implement your search logic here
        Application.Current.MainPage.DisplayAlert("Search", $"You searched for: {searchText}", "OK");
    }
}