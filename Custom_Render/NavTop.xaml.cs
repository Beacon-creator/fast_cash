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
    public NavTop()
	{
		InitializeComponent();
        BindingContext = this;
    }

}
