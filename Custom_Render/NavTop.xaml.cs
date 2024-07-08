namespace Fast_Cash.Custom_Render;

public partial class NavTop : ContentView
{

    public static readonly BindableProperty HeaderProperty =
       BindableProperty.Create(nameof(Header), typeof(string), typeof(NavTop));


    public string Header
    {
        get => (string)GetValue(HeaderProperty);
        set => SetValue(HeaderProperty, value);
    }

    public static readonly BindableProperty HomeProperty =
   BindableProperty.Create(nameof(Home), typeof(string), typeof(NavTop));

    public static readonly BindableProperty RouteProperty =
          BindableProperty.Create(nameof(Route), typeof(string), typeof(WalletsCard), string.Empty);


    public string Route
    {
        get => (string)GetValue(RouteProperty);
        set => SetValue(RouteProperty, value);
    }
    public string Home
    {
        get => (string)GetValue(HomeProperty);
        set => SetValue(HomeProperty, value);
    }
    public NavTop()
    {
        InitializeComponent();
        BindingContext = this;
    }

    private async void Home_Tapped(object sender, TappedEventArgs e)
    {

        if (!string.IsNullOrEmpty(Route))
        {
            try
            {
                await Shell.Current.GoToAsync(Route);
            }
            catch (ObjectDisposedException ex)
            {
                Console.WriteLine($"Navigation error: {ex.Message}");
                // Fallback to a known route if the object is disposed
                await Shell.Current.GoToAsync("//HomePage");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Unexpected error: {ex.Message}");
                // Fallback to a known route if another error occurs
                await Shell.Current.GoToAsync("//HomePage");
            }
        }
    }

    protected override void OnBindingContextChanged()
    {
        base.OnBindingContextChanged();
        // Ensure event handlers are attached only once
        GestureRecognizers.Clear();
        GestureRecognizers.Add(new TapGestureRecognizer { Command = new Command(() => Home_Tapped(this, null)) });
    }
}
