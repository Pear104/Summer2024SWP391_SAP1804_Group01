using System.Net;
using backend.Payment_src.core.Payment.Application.Base.Models;
using backend.Payment_src.core.Payment.Application.Features.Commands;
using backend.Payment_src.core.Payment.Application.Features.Dtos;
using BusinessObjects.Models.Payment.Domain.Entities;
using Helpers.DTOs.Merchant;
using Helpers.Mappers;
using Microsoft.AspNetCore.Mvc;
using Repositories.Interfaces.Payments;

namespace backend.Controllers
{
    /// <summary>
    /// Api for CRUD Merchant
    /// </summary>
    [Route("api/merchants")]
    [ApiController]
    public class MerchantController : ControllerBase
    {
        private readonly IMerchantRepository _merchantRepo;

        public MerchantController(IMerchantRepository merchantRepo)
        {
            _merchantRepo = merchantRepo;
        }

        /// <summary>
        /// Get merchants base on criteria
        /// </summary>
        /// <param name="criteria"></param>
        /// <returns></returns>
        [HttpGet]
        //[ProducesResponseType(typeof(BaseResultWIthData<List<MerchantDtos>>), 200)]
        [ProducesResponseType(typeof(Merchant), 200)]
        [ProducesResponseType(400)]
        public async Task<IActionResult> GetAll()
        {
            var merchants = await _merchantRepo.GetAll();

            //var response = new BaseResultWIthData<List<MerchantDtos>>();
            return Ok(merchants);
        }

        /// <summary>
        /// Get merchants paging
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("with-paging")]
        [ProducesResponseType(typeof(BaseResultWithData<BasePagingData<MerchantDtos>>), 200)]
        public IActionResult GetPaging([FromQuery] BasePagingQuery query)
        {
            var response = new BaseResultWithData<BasePagingData<MerchantDtos>>();
            return Ok(response);
        }

        /// <summary>
        /// Get one merchant by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [Route("{id}")]
        [ProducesResponseType(typeof(BaseResultWithData<MerchantDtos>), 200)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public IActionResult GetOne([FromRoute] string id)
        {
            var response = new BaseResultWithData<MerchantDtos>();
            return Ok(response);
        }

        /// <summary>
        /// Create merchant
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        /// <remarks>
        ///
        ///     POST
        ///     {
        ///         "MerchantName": "Website bán hàng A",
        ///         "MerchantWebLink": "https://webbanhang.com",
        ///         "MerchentIpnUrl": "https://webbanhang.com/ipn",
        ///         "MerchantReturnUrl": "https://webbanhang.com/payment/return"
        ///     }
        ///
        /// </remarks>
        [HttpPost]
        [ProducesResponseType(typeof(BaseResultWithData<MerchantDtos>), 200)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Create([FromBody] CreateMerchantDto request)
        {
            var merchantModel = request.ToMerchantFromCreateMerchant();
            var merchantDto = await _merchantRepo.Create(merchantModel);
            //var response = new BaseResultWIthData<MerchantDtos>();

            return Ok(merchantDto);
        }

        /// <summary>
        /// Update merchant
        /// </summary>
        /// <param name="id"></param>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("{id}")]
        [ProducesResponseType(typeof(BaseResult), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public IActionResult Update([FromRoute] string id, [FromBody] UpdateMerchant request)
        {
            var response = new BaseResult();
            return Ok(response);
        }

        /// <summary>
        /// Set active flag
        /// </summary>
        /// <param name="id"></param>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("{id}/set-active")]
        [ProducesResponseType(typeof(BaseResult), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public IActionResult SetActive([FromRoute] string id, [FromBody] UpdateMerchant request)
        {
            var response = new BaseResult();
            return Ok(response);
        }

        /// <summary>
        /// Delete merchant
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        [Route("{id}")]
        [ProducesResponseType(typeof(BaseResult), (int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public IActionResult Delete([FromRoute] string id)
        {
            var response = new BaseResult();
            return Ok(response);
        }
    }
}
