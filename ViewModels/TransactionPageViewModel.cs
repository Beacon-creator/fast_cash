using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace Fast_Cash.ViewModels
{
    public partial class TransactionPageViewModel : ObservableObject
    {
        [ObservableProperty]
        private double sliderValue;

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
    }
}
