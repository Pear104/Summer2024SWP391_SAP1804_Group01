using backend.Data;
using backend.DTOs.Account;
using backend.Interfaces;
using backend.Mappers;
using backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Packaging.Core;

namespace backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountRepository _accountRepo;

        public AccountsController(IAccountRepository accountRepo)
        {
            _accountRepo = accountRepo;
        }

        [HttpGet]
        public async Task<ActionResult> GetAccounts()
        {
            var accountModels = await _accountRepo.GetAllAccountsAsync();
            var accountDTOs = accountModels.Select(x => x.ToAccountDTO());
            return Ok(accountDTOs);
        }

        [HttpGet("me")]
        [Authorize(Roles = ("Customer"))]
        public async Task<ActionResult> GetCurrentAccount()
        {
            var accountId = User.FindFirst("accountId")?.Value;
            var accountModels = await _accountRepo.GetAccountByIdAsync(
                long.Parse(accountId ?? "0")
            );
            return Ok(accountModels?.ToAccountDTO());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetAccount(long id)
        {
            var account = await _accountRepo.GetAccountByIdAsync(id);
            if (account == null)
            {
                return NotFound();
            }

            return Ok(account.ToAccountDTO());
        }

        [HttpPut]
        [Route("{id}")]
        public async Task<IActionResult> PutAccount(
            [FromRoute] long id,
            [FromBody] UpdateAccountDTO accountDto
        )
        {
            var account = await _accountRepo.UpdateAccountAsync(id, accountDto);
            if (account == null)
            {
                return NotFound("Account not found.");
            }
            return Ok(account);
        }

        [HttpPost]
        public async Task<IActionResult> PostAccount(Account account)
        {
            var newAccount = await _accountRepo.CreateAccountAsync(account);
            if (newAccount == null)
            {
                return BadRequest("The diamond's certificate number already exists.");
            }
            return Ok(newAccount);
        }

        // [HttpDelete("{id}")]
        // public async Task<IActionResult> DeleteAccount(long id)
        // {
        //     var account = await _accountRepo.Fin;
        //     if (account == null)
        //     {
        //         return NotFound();
        //     }

        //     _context.Accounts.Remove(account);
        //     await _context.SaveChangesAsync();

        //     return NoContent();
        // }
    }
}
