using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;


namespace Cashnal.EventHandlers
    {
    public class JwtService
        {
        public static string? GetEmailFromToken(string token)
            {
            try
                {
                var handler = new JwtSecurityTokenHandler();

                if (!handler.CanReadToken(token))
                    {
                 
                    return null;
                    }        
                var jwtToken = handler.ReadJwtToken(token); // Use ReadJwtToken to get typed JwtSecurityToken

                if (jwtToken == null)
                    {
                    return null;
                    }

                // Extract the email claim using the "sub" claim type
                var emailClaim = jwtToken.Claims.FirstOrDefault(claim =>
                claim.Type == JwtRegisteredClaimNames.Email) ;
                // || claim.Type == JwtRegisteredClaimNames.Sub);

                if (emailClaim == null)
                    {
                    return null;
                    }

                return emailClaim.Value;
                }
            catch (ArgumentException)
                {
                return null;
                }
            catch (SecurityTokenExpiredException)
                {
                 return null;
                }
            catch (SecurityTokenInvalidSignatureException)
                {
                return null;
                }
            catch (Exception)
                {
              
                }

            return null;
            }
        }
    }
