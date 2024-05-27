using backend.DTOs.Authentication;
using backend.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly IAuthenticationService _authenticationService;
        private readonly IEmailSender _emailSender;

        public AuthenticationController(
            IAuthenticationService authenticationService,
            IEmailSender emailSender
        )
        {
            _authenticationService = authenticationService;
            _emailSender = emailSender;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDTO loginDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var token = await _authenticationService.Login(loginDto);
            if (token == null)
            {
                return Unauthorized("Email not found or password incorrect");
            }
            return Ok(token);
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDTO registerDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var verifyGmailToken = await _authenticationService.Register(registerDto);
            if (verifyGmailToken == null)
            {
                return Unauthorized("Email already be used");
            }
            var result = _emailSender.SendEmail(
                registerDto.Email,
                registerDto.Name,
                verifyGmailToken.Token,
                "[DATJ Diamond]: Verify your account"
            );

            return Ok(result);
        }

        [HttpGet("verify-gmail/{verifyGmailToken}")]
        public async Task<IActionResult> VerifyGmail([FromRoute] string verifyGmailToken)
        {
            var accessToken = await _authenticationService.VerifyGmail(verifyGmailToken);
            if (accessToken == null)
            {
                return Unauthorized("Email already be used");
            }
            return Ok(accessToken);
        }
    }
}
