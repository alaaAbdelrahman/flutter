using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using WebApi.Context;
using WebApi.Models;
using WebApi.Repository;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly SewedyContext _UserStore;

        public AuthController(SewedyContext UserStore)
        {
            _UserStore = UserStore ;
        }
        [HttpPost("register")]
        public IActionResult Register([FromBody] UserRegister userRegister)
        {
            // Check if the user already exists
            if (_UserStore.users.Any(u => u.Name == userRegister.Username))
            {
                return BadRequest("User already exists.");
            }

            // Add the new user to the store
            _UserStore.users.Add(new User
            {
                Name = userRegister.Username,
                Password = userRegister.Password // Note: In a real application, passwords should be hashed
            });

            return Ok("User registered successfully.");
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] UserLogin userLogin)
        {
            // Validate the user credentials
            var user = _UserStore.users.SingleOrDefault(u => u.Name == userLogin.Username && u.Password == userLogin.Password);
            if (user != null)
            {
                var token = GenerateJwtToken();
                return Ok(new { Token = token });
            }

            return Unauthorized();
        }

        private string GenerateJwtToken()
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("yourSecretKey"));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: "yourIssuer",
                audience: "yourAudience",
                expires: DateTime.Now.AddMinutes(30),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }

    public class UserRegister
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public class UserLogin
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}