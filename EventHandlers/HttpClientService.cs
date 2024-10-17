using System.Net.Http.Headers;

namespace Cashnal.EventHandlers
    {
    public class HttpClientService(HttpClient httpClient)
        {
        private readonly HttpClient _httpClient = httpClient;

        private async Task EnsureTokenAsync()
            {
            var tokenJson = await SecureStorage.GetAsync("auth_token");

            if (string.IsNullOrEmpty(tokenJson))
                {
                await Shell.Current.GoToAsync("//LoginPage");
                throw new Exception("You are not authorized.");
                }   

            var token = tokenJson;

            // Set the Authorization header
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            }

        public async Task<HttpResponseMessage> PostAsync(string requestUri, HttpContent content)
            {
            try
                {
                await EnsureTokenAsync();

                return await _httpClient.PostAsync(requestUri, content);
                }
            catch (HttpRequestException)
                {
             
                throw new Exception("Network error occurred. Please check your connection and try again.");
                }
            catch (Exception)
                {
               
                throw new Exception("An error occurred while processing your request. Please try again later.");
                }
            }

        public async Task<HttpResponseMessage> DeleteAsync(string requestUri)
            {
            try
                {
                await EnsureTokenAsync();
                return await _httpClient.DeleteAsync(requestUri);
                }
            catch (HttpRequestException)
                {
             
                throw new Exception("Network error occurred. Please check your connection and try again.");
                }
            catch (Exception)
                {
                
                throw new Exception("An error occurred while processing your request. Please try again later.");
                }
            }
        }
    }
