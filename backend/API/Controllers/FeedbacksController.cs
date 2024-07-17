using Helpers.DTOs.Feedback;
using Helpers.Queries;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Services.Interfaces;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FeedbacksController : ControllerBase
    {
        private readonly IFeedbackService _feedbackService;

        public FeedbacksController(IFeedbackService feedbackService)
        {
            _feedbackService = feedbackService;
        }

        [HttpPost]
        [Authorize(Roles = "Customer")]
        public async Task<IActionResult> PostFeedback([FromBody] CreateFeedbackDTO feedbackDTO)
        {
            if (User.FindFirst("accountId")?.Value == null)
            {
                return BadRequest("The order could not be created.");
            }
            long customerId = Convert.ToInt64(User.FindFirst("accountId")?.Value);
            var newFeedback = await _feedbackService.CreateFeedback(customerId, feedbackDTO);
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
            var feedbacksResult = await _feedbackService.GetFeedbacksOfAccessory(query);
            return Ok(feedbacksResult);
        }
    }
}
