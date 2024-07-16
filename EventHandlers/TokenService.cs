using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Fast_Cash.EventHandlers
{
    public class TokenService
    {
        private const string TokenKey = "jwt_token";
        private readonly string _secretKey;
        public async Task SaveTokenAsync(string token)
        {
            await SecureStorage.SetAsync(TokenKey, token);
        }

        public string GetToken()
        {
            return SecureStorage.GetAsync(TokenKey).Result;
        }

        public string GenerateToken(string userId, string email)
            {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_secretKey);
            var tokenDescriptor = new SecurityTokenDescriptor
                {
                Subject = new ClaimsIdentity(new[]
                {
                new Claim(ClaimTypes.NameIdentifier, userId),
                new Claim(ClaimTypes.Email, email)
            }),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
                };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
            }
        }
}
