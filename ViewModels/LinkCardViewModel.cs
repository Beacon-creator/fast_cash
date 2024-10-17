using System;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Cashnal.EventHandlers;
using Cashnal.Model;
using Microsoft.Maui.Controls;

namespace Cashnal.ViewModels
    {
    public partial class LinkCardViewModel : ObservableObject
        {
        private readonly HttpClientService _httpClientService;
        private readonly IAlertService _alertService;

        [ObservableProperty]
        private string? cardHolderName;

        [ObservableProperty]
        private string? cardNumber;

        [ObservableProperty]
        private string? cvvNumber;

        [ObservableProperty]
        private string? expiryDate;

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

            try
                {
          
                IsBusy = true;

                var cardLink = new CardLink
                    {
                    CardHolderName = CardHolderName,
                    CardNumber = CardNumber,
                    CVV = CvvNumber,
                    ExpiryDate = ExpiryDate
                    };

                var response = await _httpClientService.PostAsync("api/card-link", JsonContent.Create(cardLink));
                var responseContent = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                    {
                    IsBusy = false;
                    await _alertService.ShowAlertAsync("Success", "Card linked successfully.", "OK");
                    await Shell.Current.GoToAsync("//CardLinkSuccess");
                    }
                else
                    {
                    await _alertService.ShowAlertAsync("Error", "Failed to link card. Try again later", "OK");
                    }
                }
            catch (HttpRequestException)
                {
                await _alertService.ShowAlertAsync("Network error", "Check network connection and try again", "OK");

                }
            catch (Exception)
                {            
                await _alertService.ShowAlertAsync("Error", "An error occurred, try again later", "OK");
                }
            finally
                {
                IsBusy = false;
                }
            }
        }
    }
