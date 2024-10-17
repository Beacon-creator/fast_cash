

namespace Cashnal.Custom_Render;

public partial class TopNav : ContentView
{
    public static readonly BindableProperty HeaderProperty =
       BindableProperty.Create(nameof(Header), typeof(string), typeof(TopNav));


    public string Header
    {
        get => (string)GetValue(HeaderProperty);
        set => SetValue(HeaderProperty, value);
    }
    public TopNav()
	{
		InitializeComponent();
        BindingContext = this;
	}

    private async void BackButton_Clicked(object sender, EventArgs e)
    {
        try
        {
            if (Shell.Current.Navigation.NavigationStack.Count > 1)
            {

                await Shell.Current.Navigation.PopAsync();
            }
            else
            {
                await Shell.Current.GoToAsync("..");

          
            }
        }
        catch (Exception)
        {
         
            await Shell.Current.GoToAsync("//HomePage");
        }
    }
}

