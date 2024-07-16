using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace Fast_Cash.EventHandlers
    {
    public class FaceScannerService
        {
        private readonly string _endpoint;
        private readonly string _apiKey;
        private readonly HttpClient _httpClient;

        public FaceScannerService(string endpoint, string apiKey)
            {
            _endpoint = endpoint;
            _apiKey = apiKey;
            _httpClient = new HttpClient();
            _httpClient.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", _apiKey);
            }

        public async Task<JObject> ScanFaceAsync(Stream imageStream)
            {
            var uri = $"{_endpoint}/face/v1.0/detect?returnFaceAttributes=age,gender,emotion";

            using (var content = new StreamContent(imageStream))
                {
                content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");
                var response = await _httpClient.PostAsync(uri, content);
                var contentString = await response.Content.ReadAsStringAsync();
                return JObject.Parse(contentString);
                }
            }
        }
    }
