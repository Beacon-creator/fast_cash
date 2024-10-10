using System;
using System.Text.RegularExpressions;
using Microsoft.Maui.Controls;

namespace Cashnal.EventHandlers
{
    public class PhoneNumberValidationBehavior : Behavior<Entry>
    {
        const string phoneRegex = @"^\d{10,15}$";

        protected override void OnAttachedTo(Entry bindable)
        {
            bindable.TextChanged += HandleTextChanged;
            base.OnAttachedTo(bindable);
        }

        void HandleTextChanged(object sender, TextChangedEventArgs e)
        {
            var entry = (Entry)sender;
            bool isValid = Regex.IsMatch(e.NewTextValue, phoneRegex);
            entry.TextColor = isValid ? Colors.Black : Colors.Red;
        }

        protected override void OnDetachingFrom(Entry bindable)
        {
            bindable.TextChanged -= HandleTextChanged;
            base.OnDetachingFrom(bindable);
        }
    }
}
