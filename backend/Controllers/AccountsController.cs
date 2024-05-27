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
        private readonly ApplicationDbContext _context;
        private readonly IAccountRepository _accountRepo;

        public AccountsController(ApplicationDbContext context, IAccountRepository accountRepo)
        {
            _context = context;
            _accountRepo = accountRepo;
        }

        // GET: api/Accounts
        [HttpGet]
        public async Task<ActionResult> GetAccounts()
        {
            var accountModels = await _accountRepo.GetAllAccountsAsync();
            var accountDTOs = accountModels.Select(x => x.ToAccountDTO());
            return Ok(accountDTOs);
        }

        // GET: api/Accounts/5
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

        // PUT: api/Accounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
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
                if (!AccountExists(id))
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

        // POST: api/Accounts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Account>> PostAccount(Account account)
        {
            // _context.Accounts.Add(account);
            // await _context.SaveChangesAsync();
            Account newAccount = await _accountRepo.CreateAccountAsync(account);

            return CreatedAtAction("GetAccount", new { id = newAccount.AccountId }, newAccount);
        }

        // DELETE: api/Accounts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAccount(long id)
        {
            var account = await _context.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }

            _context.Accounts.Remove(account);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AccountExists(long id)
        {
            // return _context.Accounts.Any(e => e.AccountId == id);
            return _accountRepo.AccountExisted(id);
        }
    }
}
