using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using Microsoft.Maui.Controls;

namespace Fast_Cash.EventHandlers
    {
    public class HttpClientService
        {
        private readonly HttpClient _httpClient;

        public HttpClientService(HttpClient httpClient)
            {
            _httpClient = httpClient;
            }

        private async Task EnsureTokenAsync()
            {
            var tokenJson = await SecureStorage.GetAsync("auth_token");
            if (tokenJson == null)
                {
                await Shell.Current.GoToAsync("//LoginPage");
                throw new Exception("You are not authorized.");
                }

            var tokenObj = JObject.Parse(tokenJson);
            var token = tokenObj["token"].ToString();
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

        public async Task<HttpResponseMessage> PostAsync(string requestUri, HttpContent content)
            {
            try
                {
                await EnsureTokenAsync();
                return await _httpClient.PostAsync(requestUri, content);
                }
            catch (Exception ex)
                {
              //  Console.WriteLine($"Error in PostAsync: {ex.Message}");
                throw;
                }
            }

        public async Task<HttpResponseMessage> DeleteAsync(string requestUri)
            {
            try
                {
                await EnsureTokenAsync();
                return await _httpClient.DeleteAsync(requestUri);
                }
            catch (Exception ex)
                {
               // Console.WriteLine($"Error in DeleteAsync: {ex.Message}");
                throw;
                }
            }
        }
    }
