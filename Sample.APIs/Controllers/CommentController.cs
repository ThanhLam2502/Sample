using Microsoft.AspNetCore.Mvc;
using Sample.Entities.Resources;
using Sample.Entities.Services;
using Sample.Entities.ViewModels;
using System.Threading.Tasks;

namespace Sample.APIs.Controllers
{
    [Route("api/comments")]
    [ApiController]
    public class CommentController : BaseApiController
    {
        private readonly ICommentService _commentService;

        public CommentController(ICommentService commentService)
        {
            _commentService = commentService;
        }

        //[HttpGet]
        //public async Task<IActionResult> GetComment()
        //{
        //    var response = await _commentService.GetComments();
        //    return StatusCode(response);
        //}

        // GET: api/comments/0
        [HttpGet("task/{id:int}")]
        public async Task<IActionResult> GetCommentByTaskID([FromRoute]int id)    
        {
            var response = await _commentService.GetCommentByTaskID(id);
            return StatusCode(response);
        }     

        [HttpPost]
        public async Task<IActionResult> InsertComment([FromBody] CommentViewModel model)
        {
            var response = await _commentService.InsertComment(model);
            return StatusCode(response);
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> UpdateCmtContent([FromBody] CommentViewModel model, int id)
        {
            var response = await _commentService.UpdateCmtContent(model, id);
            return StatusCode(response);
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteComment(int id)
        {
            var response = await _commentService.DeleteComment(id);
            return StatusCode(response);
        }
    }
}