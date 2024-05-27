using backend.Data;
using backend.Mappers;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Packaging.Core;
using backend.Interfaces;

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

        [HttpGet("{id}")]
        public async Task<ActionResult<Account>> GetAccount(long id)
        {
            var account = await _accountRepo.GetAccountByIdAsync(id);

            if (account == null)
            {
                return NotFound();
            }

            return account;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutAccount(long id, Account account)
        {
            if (id != account.AccountId)
            {
                return BadRequest();
            }

            // _context.Entry(account).State = EntityState.Modified;
            
            try
            {
                await _accountRepo.UpdateAccountAsync(id, account);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (_accountRepo.GetAccountByIdAsync(id) == null)
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Account>> PostAccount(Account account)
        {
            // _context.Accounts.Add(account);
            // await _context.SaveChangesAsync();
            Account newAccount = await _accountRepo.CreateAccountAsync(account);

            return CreatedAtAction("GetAccount", new { id = newAccount.AccountId }, newAccount);
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
