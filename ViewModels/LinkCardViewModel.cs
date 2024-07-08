// ViewModels/LinkCardViewModel.cs
using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Fast_Cash.EventHandlers;
using Fast_Cash.Model;
using Microsoft.Maui.Controls;
using OpenCvSharp;

namespace Fast_Cash.ViewModels
{
    public partial class LinkCardViewModel : ObservableObject
    {
        private readonly HttpClient _httpClient;
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

        public LinkCardViewModel(HttpClient httpClient, IAlertService alertService)
        {
            _httpClient = httpClient;
            _alertService = alertService;

            // Set the base address if it is not already set
            if (_httpClient.BaseAddress == null)
            {
                _httpClient.BaseAddress = new Uri("https://aspbackend20240622133116.azurewebsites.net/");
            }
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
                var response = await _httpClient.PostAsJsonAsync("api/CardLink", cardLink);
                if (response.IsSuccessStatusCode)
                {
                   

                    IsBusy = false; // hide the spinner
                    await Application.Current.MainPage.DisplayAlert("Success", "Card linked successfully.", "OK");
                    // await _alertService.ShowAlertAsync("Success", "Card linked successfully.", "OK");
                    await Shell.Current.GoToAsync("//CardLinkSuccess");
                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Failed to link card.", "OK");
                }
            }
            catch (HttpRequestException ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Request error: {ex.Message}", "OK");
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
            finally
            {
                IsBusy = false;
            }
        }
    }
}
