using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fast_Cash.EventHandlers
{
    public class TokenService
    {
        private const string TokenKey = "jwt_token";

        public async Task SaveTokenAsync(string token)
        {
            await SecureStorage.SetAsync(TokenKey, token);
        }

        public string GetToken()
        {
            return SecureStorage.GetAsync(TokenKey).Result;
        }
    }
}
