using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Threading.Tasks;

namespace Fast_Cash.ViewModels
    {
    public partial class TransactionPageViewModel : ObservableObject
        {
        [ObservableProperty]
        private double sliderValue;

        [ObservableProperty]
        private bool isFromDateCalendarOpen;

        [ObservableProperty]
        private bool isToDateCalendarOpen;

        public string AmountOfMoneyLabel => $"Amount: N{SliderValue * 1000}";

        public IRelayCommand ClearSliderCommand { get; }

        public TransactionPageViewModel()
            {
            ClearSliderCommand = new RelayCommand(ClearSlider);
            }

        partial void OnSliderValueChanged(double value)
            {
            OnPropertyChanged(nameof(AmountOfMoneyLabel));
            }

        private void ClearSlider()
            {
            SliderValue = 0;
            }

        [RelayCommand]
        private async Task OnFromDateCalendarTapped()
            {
            Console.WriteLine("From Date Calendar Tapped");
            await Task.Delay(0);
            if (IsToDateCalendarOpen)
                {
                IsToDateCalendarOpen = false;
                }
            IsFromDateCalendarOpen = !IsFromDateCalendarOpen;
            }

        [RelayCommand]
        private async Task OnToDateCalendarTapped()
            {
            Console.WriteLine("To Date Calendar Tapped");
            await Task.Delay(0);
            if (IsFromDateCalendarOpen)
                {
                IsFromDateCalendarOpen = false;
                }
            IsToDateCalendarOpen = !IsToDateCalendarOpen;
            }
        }
    }
