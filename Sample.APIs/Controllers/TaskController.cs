using Microsoft.AspNetCore.Mvc;
using Sample.Entities.Resources;
using Sample.Entities.Services;
using Sample.Entities.ViewModels;
using System.Threading.Tasks;

namespace Sample.APIs.Controllers
{
    [Route("api/tasks")]
    [ApiController]
    public class TaskController : ControllerBase
    {
        private readonly ITaskService _taskService;

        public TaskController(ITaskService taskService)
        {
            _taskService = taskService;
        }

        [HttpPost]
        public async Task<IActionResult> PutTask([FromBody] TaskViewModel task)
        {
            return Ok(new
            {
                message = Messages.ItemUpdated
            });
        }

    }
}