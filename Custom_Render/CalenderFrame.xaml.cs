using Microsoft.Maui.Controls;
using System;
using System.Collections.ObjectModel;
using System.Globalization;

namespace Fast_Cash.Custom_Render;

public partial class CalenderFrame : ContentView
{
    public static readonly BindableProperty SelectedDateProperty =
        BindableProperty.Create(nameof(SelectedDate), typeof(DateTime), typeof(CalenderFrame), DateTime.Today, propertyChanged: OnSelectedDateChanged);

    public DateTime SelectedDate
    {
        get => (DateTime)GetValue(SelectedDateProperty);
        set => SetValue(SelectedDateProperty, value);
    }

    private static void OnSelectedDateChanged(BindableObject bindable, object oldValue, object newValue)
    {
        var calendarFrame = (CalenderFrame)bindable;
        calendarFrame.UpdateCalendar();
        calendarFrame.OnPropertyChanged(nameof(calendarFrame.SelectedDateString));
    }

    public ObservableCollection<string> Days { get; set; } = new ObservableCollection<string>();

    public string CurrentMonthYear => SelectedDate.ToString("MMMM yyyy", CultureInfo.InvariantCulture);

    public string SelectedDateString => SelectedDate.ToString("MM/dd/yyyy");

    public CalenderFrame()
    {
        InitializeComponent();
        BindingContext = this;
        UpdateCalendar();
    }

    private void UpdateCalendar()
    {
        Days.Clear();

        var firstDayOfMonth = new DateTime(SelectedDate.Year, SelectedDate.Month, 1);
        var startDayOfWeek = (int)firstDayOfMonth.DayOfWeek;

        for (int i = 0; i < startDayOfWeek; i++)
        {
            Days.Add(string.Empty);
        }

        var daysInMonth = DateTime.DaysInMonth(SelectedDate.Year, SelectedDate.Month);
        for (int i = 1; i <= daysInMonth; i++)
        {
            Days.Add(i.ToString());
        }

        OnPropertyChanged(nameof(CurrentMonthYear));
    }

    private void PreviousMonthClicked(object sender, EventArgs e)
    {
        SelectedDate = SelectedDate.AddMonths(-1);
    }

    private void NextMonthClicked(object sender, EventArgs e)
    {
        SelectedDate = SelectedDate.AddMonths(1);
    }

    private void DayTapped(object sender, EventArgs e)
    {
        var frame = sender as Frame;
        if (frame != null && frame.Content is Label label && int.TryParse(label.Text, out int day))
        {
            SelectedDate = new DateTime(SelectedDate.Year, SelectedDate.Month, day);
            calendarPopup.IsVisible = false;
        }
    }

    private void CalendarIconClicked(object sender, EventArgs e)
    {
        calendarPopup.IsVisible = true;
    }

    private void ClosePopupClicked(object sender, EventArgs e)
    {
        calendarPopup.IsVisible = false;
    }
}
