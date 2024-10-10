using Cashnal.EventHandlers;
using Microsoft.Maui.Controls;
using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Threading.Tasks;

namespace Cashnal.Custom_Render
    {
    public partial class CardScanner : ContentView
        {
        private CardScannerService _cardScannerService;
        private string _apiKey;

        public CardScanner()
            {
            InitializeComponent();
            }

        public string ApiKey
            {
            get => _apiKey;
            set
                {
                _apiKey = value;
                if (!string.IsNullOrWhiteSpace(_apiKey))
                    {
                    _cardScannerService = new CardScannerService(_apiKey);
                    }
                }
            }

        private async void OnScanButtonClicked(object sender, EventArgs e)
            {
            var photoResult = await MediaPicker.PickPhotoAsync();

            if (photoResult != null)
                {
                using var stream = await photoResult.OpenReadAsync();
                CardImage.Source = ImageSource.FromStream(() => stream);

                var detectedText = await _cardScannerService.ScanCardAsync(stream);
                DisplayDetectedText(detectedText);
                }
            }

        private void DisplayDetectedText(JObject detectedText)
            {
            var textAnnotations = detectedText["responses"]?[0]?["textAnnotations"];
            if (textAnnotations != null && textAnnotations.HasValues)
                {
                var extractedText = textAnnotations[0]["description"].ToString();
                ResultLabel.Text = $"Detected Text: {extractedText}";
                }
            else
                {
                ResultLabel.Text = "No text detected.";
                }
            }
        }
    }
