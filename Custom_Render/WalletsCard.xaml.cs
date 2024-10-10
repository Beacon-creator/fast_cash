using System;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;

namespace Cashnal.Custom_Render
{
    public partial class WalletsCard : ContentView
    {
        // Bindable properties
        public static readonly BindableProperty BackgroundImageSourceProperty =
            BindableProperty.Create(nameof(BackgroundImageSource), typeof(ImageSource), typeof(WalletsCard));

        public static readonly BindableProperty MainTextProperty =
            BindableProperty.Create(nameof(MainText), typeof(string), typeof(WalletsCard));

        public static readonly BindableProperty RouteProperty =
            BindableProperty.Create(nameof(Route), typeof(string), typeof(WalletsCard), string.Empty);

        public ImageSource BackgroundImageSource
        {
            get => (ImageSource)GetValue(BackgroundImageSourceProperty);
            set => SetValue(BackgroundImageSourceProperty, value);
        }

        public string MainText
        {
            get => (string)GetValue(MainTextProperty);
            set => SetValue(MainTextProperty, value);
        }

        public string Route
        {
            get => (string)GetValue(RouteProperty);
            set => SetValue(RouteProperty, value);
        }

        public WalletsCard()
        {
            InitializeComponent();
            BindingContext = this;
        }

        private async void WalletFrame_Tapped(object sender, EventArgs e)
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
            GestureRecognizers.Add(new TapGestureRecognizer { Command = new Command(() => WalletFrame_Tapped(this, null)) });
        }
    }
}
