using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using Newtonsoft.Json.Linq;
using Fast_Cash.EventHandlers;

namespace Fast_Cash.Custom_Render
    {
    public partial class FaceScanner : ContentView
        {
        private readonly FaceScannerService _faceScannerService;

        public FaceScanner(string endpoint, string apiKey)
            {
            InitializeComponent();
            _faceScannerService = new FaceScannerService(endpoint, apiKey);
            }

        private async void OnScanButtonClicked(object sender, EventArgs e)
            {
            var photoResult = await MediaPicker.PickPhotoAsync();

            if (photoResult != null)
                {
                using var stream = await photoResult.OpenReadAsync();
                FaceImage.Source = ImageSource.FromStream(() => stream);

                var detectedFaces = await _faceScannerService.ScanFaceAsync(stream);
                DisplayDetectedFaces(detectedFaces);
                }
            }

        private void DisplayDetectedFaces(IReadOnlyList<DetectedFace> detectedFaces)
            {
            if (detectedFaces.Count > 0)
                {
                var faceAttributes = detectedFaces[0].FaceAttributes;
                var result = $"Detected {detectedFaces.Count} face(s)\n";
                result += $"Age: {faceAttributes.Age}\n";
                result += $"Gender: {faceAttributes.Gender}\n";
                result += $"Emotion: {faceAttributes.Emotion.ToRankedList().FirstOrDefault()?.Key}\n";

                ResultLabel.Text = result;
                }
            else
                {
                ResultLabel.Text = "No face detected.";
                }
            }
        }
    }
