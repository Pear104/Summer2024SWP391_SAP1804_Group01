using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.DTOs.Feedback;
using backend.Helper;
using backend.Interfaces;
using backend.Mappers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FeedbacksController : ControllerBase
    {
        private readonly IFeedbackRepository _feedbackRepo;

        public FeedbacksController(IFeedbackRepository FeedbackRepo)
        {
            _feedbackRepo = FeedbackRepo;
        }

        [HttpPost]
        [Authorize(Roles = ("Customer"))]
        public async Task<IActionResult> PostFeedback([FromBody] CreateFeedbackDTO feedbackDTO)
        {
            if (User.FindFirst("accountId")?.Value == null)
            {
                return BadRequest("The order could not be created.");
            }
            long customerId = Convert.ToInt64(User.FindFirst("accountId")?.Value);
            var newFeedback = await _feedbackRepo.CreateFeedbackAsync(customerId, feedbackDTO);
            if (newFeedback == null)
            {
                return BadRequest("You dont have permission to feedback.");
            }
            return Ok(newFeedback);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetFeedbacksOfAccessory(
            long id,
            [FromQuery] FeedbackQuery query
        )
        {
            query.AccessoryId = id;
            var feedbacksResult = await _feedbackRepo.GetFeedbacksOfAccessoryAsync(query);
            return Ok(feedbacksResult);
        }
    }
}
