using System.Security.Claims;
using Helpers.DTOs.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
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
            var result = _emailSender.SendVerifyEmail(
                registerDto.Email,
                registerDto.Name,
                verifyGmailToken.Token,
                "[DATJ Diamond] – Email verification"
            );

            return Ok(result);
        }

        [HttpPost("verify-gmail")]
        public async Task<IActionResult> VerifyGmail()
        {
            try
            {
                if (HttpContext.Request.Headers.TryGetValue("Authorization", out var headerAuth))
                {
                    var verifyGmailToken = headerAuth
                        .First()
                        .Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries)[1];
                    Console.WriteLine("token:" + verifyGmailToken);
                    var accessToken = await _authenticationService.VerifyGmail(verifyGmailToken);
                    if (accessToken == null)
                    {
                        return Unauthorized("Email already be used");
                    }
                    return Ok(accessToken);
                }
                return BadRequest();
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }

        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordDTO resetPasswordDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var resetToken = await _authenticationService.GetResetToken(resetPasswordDto);
            if (resetToken == null)
            {
                return Unauthorized("Email hasn't been registered");
            }
            var result = _emailSender.SendResetEmail(
                resetPasswordDto.Email,
                "",
                resetToken.Token,
                "[DATJ Diamond] – Reset password verification"
            );

            return Ok(result);
        }

        [HttpPost("confirm-password")]
        [Authorize]
        public async Task<IActionResult> ConfirmPassword(
            [FromBody] UpdatePasswordDTO updatePasswordDto
        )
        {
            Console.WriteLine("email: " + User.FindFirst(ClaimTypes.Email)?.Value);
            var accessToken = await _authenticationService.ResetPassword(
                updatePasswordDto.Email,
                updatePasswordDto
            );
            if (accessToken == null)
            {
                return Unauthorized("Email already be used");
            }
            return Ok(accessToken);
        }

        [HttpPost("login-google")]
        public async Task<IActionResult> LoginGoogle([FromBody] LoginGoogleDTO loginGoogleDto)
        {
            var accessToken = await _authenticationService.LoginGoogle(loginGoogleDto);
            if (accessToken == null)
            {
                return Unauthorized("Email not existing!");
            }
            return Ok(accessToken);
        }

        [HttpPost("register-google")]
        public async Task<IActionResult> RegisterGoogle([FromBody] RegisterDTO registerGoogleDto)
        {
            var accessToken = await _authenticationService.RegisterGoogle(registerGoogleDto);
            if (accessToken == null)
            {
                return Unauthorized("Email already be used");
            }
            return Ok(accessToken);
        }
    }
}
