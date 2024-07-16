using System.Collections.ObjectModel;
using System;
using Fast_Cash.ViewModels;
using Microsoft.Maui.Controls.Xaml;
using System.Collections.Generic;
using Microsoft.Maui.Controls;
using Microsoft.Maui;

namespace Fast_Cash.Pages
{
    public partial class StartPage : ContentPage
    {
        public StartPage()
        {
            InitializeComponent();
            BindingContext = new StartPageViewModel();

        }
    }
}