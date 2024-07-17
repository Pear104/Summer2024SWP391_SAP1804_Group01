using BusinessObjects.Enums;
using Helpers.DTOs.Account;
using Helpers.DTOs.Authentication;
using Helpers.Mappers;
using Helpers.Queries;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountService _accountService;

        public AccountsController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpGet]
        public async Task<ActionResult> GetAccounts([FromQuery] AccountQuery query)
        {
            var accountModels = await _accountService.GetAllAccounts(query);
            var accountDTOs = accountModels.Select(x => x.ToAccountDTO());
            return Ok(accountDTOs);
        }

        [HttpGet("me")]
        [Authorize]
        public async Task<ActionResult> GetCurrentAccount()
        {
            var accountId = User.FindFirst("accountId")?.Value;
            var accountModels = await _accountService.GetAccountById(long.Parse(accountId ?? "0"));
            return Ok(accountModels?.ToAccountDTO());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetAccount(long id)
        {
            var account = await _accountService.GetAccountById(id);
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
            var account = await _accountService.UpdateAccount(id, accountDto);
            if (account == null)
            {
                return NotFound("Account not found.");
            }
            return Ok(account);
        }

        [HttpPost]
        public async Task<IActionResult> PostAccount([FromBody] RegisterDTO registerDTO)
        {
            var newAccount = await _accountService.CreateAccount(registerDTO);
            if (newAccount == null)
            {
                return BadRequest("The diamond's certificate number already exists.");
            }
            return Ok(newAccount);
        }

        [HttpPut("ChangePassword/{id}")]
        public async Task<IActionResult> ChangePassword(
            [FromRoute] long id,
            [FromBody] UpdatePasswordAccountDTO account
        )
        {
            var newAccount = await _accountService.UpdatePassword(id, account);
            if (newAccount == null)
            {
                return BadRequest("The current password is incorrect.");
            }
            return Ok(newAccount);
        }

        /// <summary>
        /// Search for customer's accounts based on name and phone number
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("Customer")]
        public async Task<ActionResult> GetCustomerAccounts([FromQuery] AccountSearchQuery query)
        {
            query.AccountRole = Role.Customer.ToString();
            var accountsListModels = await _accountService.SearchAccountOnRole(query);
            ListWithPagingDTO<AccountDTO> accountsDTO =
                new()
                {
                    Content = accountsListModels.Content!.Select(x => x.ToAccountDTO()).ToList(),
                    PageSize = accountsListModels.PageSize,
                    CurrentPage = accountsListModels.CurrentPage,
                    TotalCount = accountsListModels.TotalCount,
                    TotalPages = accountsListModels.TotalPages
                };

            return Ok(accountsDTO);
        }

        /// <summary>
        /// Get customer by Id, order not included.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("Customer/{id}")]
        public ActionResult GetCustomerById([FromRoute] long id)
        {
            ActionResult result = BadRequest();
            var customerModel = _accountService.GetCustomerById(id);
            if (customerModel != null)
            {
                result = Ok(customerModel);
            }
            return result;
        }

        /// <summary>
        /// Search for sale staff's accounts based on name and phone number
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("SaleStaff")]
        public async Task<ActionResult> GetSaleStaffAccounts([FromQuery] AccountSearchQuery query)
        {
            query.AccountRole = Role.SaleStaff.ToString();
            var accountsListModels = await _accountService.SearchAccountOnRole(query);
            ListWithPagingDTO<AccountDTO> accountsDTO =
                new()
                {
                    Content = accountsListModels.Content!.Select(x => x.ToAccountDTO()).ToList(),
                    PageSize = accountsListModels.PageSize,
                    CurrentPage = accountsListModels.CurrentPage,
                    TotalCount = accountsListModels.TotalCount,
                    TotalPages = accountsListModels.TotalPages
                };

            return Ok(accountsDTO);
        }

        /// <summary>
        /// Search for warranty staff's accounts based on name and phone number
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>

        [HttpGet]
        [Route("WarrantyStaff")]
        public async Task<ActionResult> GetWarrantyAccounts([FromQuery] AccountSearchQuery query)
        {
            query.AccountRole = Role.WarrantyStaff.ToString();
            var accountsListModels = await _accountService.SearchAccountOnRole(query);
            ListWithPagingDTO<AccountDTO> accountsDTO =
                new()
                {
                    Content = accountsListModels.Content!.Select(x => x.ToAccountDTO()).ToList(),
                    PageSize = accountsListModels.PageSize,
                    CurrentPage = accountsListModels.CurrentPage,
                    TotalCount = accountsListModels.TotalCount,
                    TotalPages = accountsListModels.TotalPages
                };

            return Ok(accountsDTO);
        }

        /// <summary>
        /// Search for delivery staff's accounts based on name and phone number
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("DeliveryStaff")]
        public async Task<ActionResult> GetDeliveryStaffAccounts(
            [FromQuery] AccountSearchQuery query
        )
        {
            query.AccountRole = Role.DeliveryStaff.ToString();
            var accountsListModels = await _accountService.SearchAccountOnRole(query);
            ListWithPagingDTO<AccountDTO> accountsDTO =
                new()
                {
                    Content = accountsListModels.Content!.Select(x => x.ToAccountDTO()).ToList(),
                    PageSize = accountsListModels.PageSize,
                    CurrentPage = accountsListModels.CurrentPage,
                    TotalCount = accountsListModels.TotalCount,
                    TotalPages = accountsListModels.TotalPages
                };

            return Ok(accountsDTO);
        }

        [HttpDelete("{id}/{isDisable}")]
        public async Task<IActionResult> DeleteAccount(
            [FromRoute] long id,
            [FromRoute] bool isDisable
        )
        {
            var model = await _accountService.DeleteAccount(id, isDisable);
            if (model == null)
            {
                return NotFound("Account not found.");
            }
            return Ok(model);
        }
    }
}
