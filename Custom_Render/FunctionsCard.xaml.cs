using System;
using Microsoft.Maui.Controls.Xaml;
using Microsoft.Maui.Controls;
using Microsoft.Maui;

namespace Cashnal.Custom_Render;

public partial class FunctionsCard : ContentView
{

    // Bindable properties
    public static readonly BindableProperty BackgroundImageSourceProperty =
        BindableProperty.Create(nameof(BackgroundImageSource), typeof(ImageSource), typeof(FunctionsCard));

    public static readonly BindableProperty HeadTextProperty =
        BindableProperty.Create(nameof(HeadText), typeof(string), typeof(FunctionsCard));

    public static readonly BindableProperty SubTextProperty =
        BindableProperty.Create(nameof(SubText), typeof(string), typeof(FunctionsCard));


    public ImageSource BackgroundImageSource
    {
        get => (ImageSource)GetValue(BackgroundImageSourceProperty);
        set => SetValue(BackgroundImageSourceProperty, value);
    }

    public string HeadText
    {
        get => (string)GetValue(HeadTextProperty);
        set => SetValue(HeadTextProperty, value);
    }

    public string SubText
    {
        get => (string)GetValue(SubTextProperty);
        set => SetValue(SubTextProperty, value);
    }

    public FunctionsCard()
	{
		InitializeComponent();
        BindingContext = this;
    }
}