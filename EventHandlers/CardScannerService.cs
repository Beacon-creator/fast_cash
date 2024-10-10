using System;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace Cashnal.EventHandlers
    {
    public class CardScannerService
        {
        private readonly string _apiKey;
        private readonly HttpClient _httpClient;

        public CardScannerService(string apiKey)
            {
            _apiKey = apiKey;
            _httpClient = new HttpClient();
            }

        public async Task<JObject> ScanCardAsync(Stream imageStream)
            {
            var uri = $"https://vision.googleapis.com/v1/images:annotate?key={_apiKey}";

            var base64Image = Convert.ToBase64String(ReadFully(imageStream));
            var requestBody = new
                {
                requests = new[]
                {
                    new
                    {
                        image = new
                        {
                            content = base64Image
                        },
                        features = new[]
                        {
                            new
                            {
                                type = "TEXT_DETECTION"
                            }
                        }
                    }
                }
                };

            var jsonRequestBody = JObject.FromObject(requestBody).ToString();
            var content = new StringContent(jsonRequestBody, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(uri, content);
            var contentString = await response.Content.ReadAsStringAsync();
            return JObject.Parse(contentString);
            }

        private static byte[] ReadFully(Stream input)
            {
            using (MemoryStream ms = new MemoryStream())
                {
                input.CopyTo(ms);
                return ms.ToArray();
                }
            }
        }
    }
