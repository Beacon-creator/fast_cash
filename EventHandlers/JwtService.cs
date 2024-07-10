using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
using System.Threading.Tasks;

namespace Fast_Cash.EventHandlers
{
    public class JwtService
    {
        public string? GetEmailFromToken(string token)
        {
            var handler = new JwtSecurityTokenHandler();
            var jwtToken = handler.ReadToken(token) as JwtSecurityToken;

            if (jwtToken != null)
            {
                var emailClaim = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "NameIdentifier");
                return emailClaim?.Value;
            }

            return null;
        }
    }
}
