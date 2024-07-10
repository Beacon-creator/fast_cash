using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace Fast_Cash.EventHandlers
{
    public class HttpClientService
    {
        private readonly HttpClient _httpClient;

        public HttpClientService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<HttpResponseMessage> PostAsync(string requestUri, HttpContent content)
        {
            var tokenJson = await SecureStorage.GetAsync("auth_token");
            if (tokenJson == null)
            {
                throw new Exception("Token could not be retrieved.");
            }

            var tokenObj = JObject.Parse(tokenJson);
            var token = tokenObj["token"].ToString();

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            // Log the request details
            Console.WriteLine($"Request URI: {_httpClient.BaseAddress}{requestUri}");
            Console.WriteLine($"Authorization Header: Bearer {token}");

            return await _httpClient.PostAsync(requestUri, content);
        }

        public async Task<HttpResponseMessage> DeleteAsync(string requestUri)
        {
            var tokenJson = await SecureStorage.GetAsync("auth_token");
            if (tokenJson == null)
            {
                throw new Exception("Token could not be retrieved.");
            }

            var tokenObj = JObject.Parse(tokenJson);
            var token = tokenObj["token"].ToString();

            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            // Log the request details
            Console.WriteLine($"Request URI: {_httpClient.BaseAddress}{requestUri}");
            Console.WriteLine($"Authorization Header: Bearer {token}");

            return await _httpClient.DeleteAsync(requestUri);
        }
    }
}
