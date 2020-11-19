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
        // POST api/tasks
        [HttpPost]
        public async Task AddListTask([FromBody] ListTaskViewModel listTaskViewModel)
        {
            await _taskService.InsertListTask(listTaskViewModel);
        }
        // PUT api/tasks/5
        [HttpPut("{id:int}")]
        public async Task UpdateListTask([FromBody] ListTaskViewModel listTaskViewModel, int id)
        {
            await _taskService.UpdateListTask(listTaskViewModel, id);
        }
        // DELETE api/tasks/3
        [HttpDelete("{id:int}")]
        public void DeleteListTask(int id)
        {
            _taskService.DeleteListTask(id);
        }

        // POST api/tasks/task
        [HttpPost("task")]
        public async Task AddTask([FromBody] TaskViewModel taskViewModel)
        {
            await _taskService.InsertTask(taskViewModel);
        }

        // PUT api/tasks/5/task/2
        [HttpPut("task/{id:int}")]
        public async Task UpdateTask([FromBody] TaskViewModel taskViewModel, int id)
        {
            await _taskService.UpdateTask(taskViewModel, id);
        }
        // DELETE api/tasks/task/2
        [HttpDelete("task/{id:int}")]
        public void DeleteTask(int id)
        {
            _taskService.DeleteTask(id);
        }

    }
}