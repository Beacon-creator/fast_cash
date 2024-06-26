using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Compatibility;
using System;

namespace Fast_Cash.Custom_Render;

public partial class CalenderFrame : ContentView
{
    private DatePicker datePicker;

    public CalenderFrame()
	{
		InitializeComponent();

        InitializeDatePicker();
    }

    private void InitializeDatePicker()
    {
        datePicker = new DatePicker
        {
            IsVisible = false
        };

        datePicker.DateSelected += OnDateSelected;

        // Add DatePicker to the layout but keep it hidden
        (Content as Layout<View>).Children.Add(datePicker);
    }

    private void OnCalendarButtonClicked(object sender, EventArgs e)
    {
        datePicker.Focus();
    }

    private void OnDateSelected(object sender, DateChangedEventArgs e)
    {
        SelectedDateLabel.Text = e.NewDate.ToString("d");
    }
}