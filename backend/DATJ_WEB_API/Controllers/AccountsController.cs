﻿using backend.Data;
using backend.DTOs.Account;
using backend.Enums;
using backend.Services.Helper;
using backend.Interfaces;
using backend.Services.Mappers;
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
        public async Task<ActionResult> GetAccounts([FromQuery] AccountQuery query)
        {
            var accountModels = await _accountRepo.GetAllAccountsAsync(query);
            var accountDTOs = accountModels.Select(x => x.ToAccountDTO());
            return Ok(accountDTOs);
        }

        [HttpGet("me")]
        [Authorize]
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

        [HttpPut("ChangePassword/{id}")]
        public async Task<IActionResult> ChangePassword(
            [FromRoute] long id,
            [FromBody] UpdatePasswordAccountDTO account
        )
        {
            var newAccount = await _accountRepo.UpdatePasswordAsync(id, account);
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
            var accountsListModels = await _accountRepo.SearchAccountOnRole(query);
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
            var customerModel = _accountRepo.GetCustomerByIdAsync(id);
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
            var accountsListModels = await _accountRepo.SearchAccountOnRole(query);
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
            var accountsListModels = await _accountRepo.SearchAccountOnRole(query);
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
            var accountsListModels = await _accountRepo.SearchAccountOnRole(query);
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
            var model = await _accountRepo.DeleteAccountAsync(id, isDisable);
            if (model == null)
            {
                return NotFound("Account not found.");
            }
            return Ok(model);
        }
    }
}