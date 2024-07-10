// ViewModels/LinkCardViewModel.cs
using System;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Model;
using Microsoft.Maui.Controls;

namespace Fast_Cash.ViewModels
{
    public partial class LinkCardViewModel : ObservableObject
    {
        private readonly HttpClientService _httpClientService;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string cardHolderName;

        [ObservableProperty]
        private string cardNumber;

        [ObservableProperty]
        private string cvvNumber;

        [ObservableProperty]
        private string expiryDate;

        [ObservableProperty]
        private bool isBusy;

        public LinkCardViewModel(HttpClientService httpClientService, IAlertService alertService)
        {
            _httpClientService = httpClientService;
            _alertService = alertService;
        }

        [RelayCommand]
        private async Task LinkCard()
        {
            if (IsBusy)
                return;

            IsBusy = true;

            var cardLink = new CardLink
            {
                CardHolderName = CardHolderName,
                CardNumber = CardNumber,
                CVV = CvvNumber,
                ExpiryDate = ExpiryDate
            };

            try
            {
                var response = await _httpClientService.PostAsync("api/CardLinks", JsonContent.Create(cardLink));
                var responseContent = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"Response Status Code: {response.StatusCode}");
                Console.WriteLine($"Response Content: {responseContent}");

                if (response.IsSuccessStatusCode)
                {
                    await _alertService.ShowAlertAsync("Success", "Card linked successfully.", "OK");
                    await Shell.Current.GoToAsync("//CardLinkSuccess");
                }
                else
                {
                    await _alertService.ShowAlertAsync("Error", $"Failed to link card. Server response: {responseContent}", "OK");
                }
            }
            catch (HttpRequestException ex)
            {
                await _alertService.ShowAlertAsync("Error", $"Request error: {ex.Message}", "OK");
            }
            catch (Exception ex)
            {
                await _alertService.ShowAlertAsync("Error", $"An error occurred: {ex.Message}", "OK");
            }
            finally
            {
                IsBusy = false;
            }
        }
    }
}
