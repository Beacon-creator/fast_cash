﻿using System;
using System.Text.RegularExpressions;
using Microsoft.Maui.Controls;
using Fast_Cash.Model;

namespace Fast_Cash.EventHandlers
{
    public class PasswordValidationBehavior : Behavior<LineEntry>
    {
        const string passwordRegex = @"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!/.%*#?&]{6,}$";
        static readonly BindablePropertyKey IsValidPropertyKey = BindableProperty.CreateReadOnly("IsValid", typeof(bool), typeof(PasswordValidationBehavior), false);
        public static readonly BindableProperty IsValidProperty = IsValidPropertyKey.BindableProperty;

        public bool IsValid
        {
            get { return (bool)base.GetValue(IsValidProperty); }
            private set { base.SetValue(IsValidPropertyKey, value); }
        }

        protected override void OnAttachedTo(LineEntry bindable)
        {
            bindable.TextChanged += HandleTextChanged;
            base.OnAttachedTo(bindable);
        }

        void HandleTextChanged(object sender, TextChangedEventArgs e)
        {
            if (e.NewTextValue != null)
            {
                IsValid = Regex.IsMatch(e.NewTextValue, passwordRegex);
                ((LineEntry)sender).TextColor = IsValid ? Colors.Blue : Colors.Red;
            }
            else
            {
                IsValid = false;
                ((LineEntry)sender).TextColor = Colors.Red;
            }
        }


        protected override void OnDetachingFrom(LineEntry bindable)
        {
            bindable.TextChanged -= HandleTextChanged;
            base.OnDetachingFrom(bindable);
        }
    }
}