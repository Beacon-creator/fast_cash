using Fast_Cash.Model;
using Microsoft.Maui.Controls;

namespace Fast_Cash.EventHandlers
    {
    public class AutoFocusBehavior : Behavior<LineEntry>
        {
        public LineEntry? NextEntry { get; set; }
        public LineEntry? PreviousEntry { get; set; }

        protected override void OnAttachedTo(LineEntry bindable)
            {
            base.OnAttachedTo(bindable);
            bindable.TextChanged += OnTextChanged;
            bindable.Unfocused += OnUnfocused;
            }

        protected override void OnDetachingFrom(LineEntry bindable)
            {
            base.OnDetachingFrom(bindable);
            bindable.TextChanged -= OnTextChanged;
            bindable.Unfocused -= OnUnfocused;
            }

        private void OnTextChanged(object sender, TextChangedEventArgs e)
            {
            var entry = sender as LineEntry;
            if (entry.Text.Length == 1 && NextEntry != null)
                {
                NextEntry.Focus();
                }
            }

        private void OnUnfocused(object sender, FocusEventArgs e)
            {
            var entry = sender as LineEntry;
            if (entry.Text.Length == 0 && PreviousEntry != null)
                {
                PreviousEntry.Focus();
                }
            }
        }
    }
