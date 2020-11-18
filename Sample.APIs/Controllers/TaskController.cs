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
        public async Task UpdateListTask([FromBody] ListTaskViewModel listTaskViewModel)
        {
            await _taskService.UpdateListTask(listTaskViewModel);
        }
        // DELETE api/tasks/3
        [HttpDelete("{id:int}")]
        public void DeleteListTask(int id)
        {
            _taskService.DeleteListTask(id);
        }

        // POST api/tasks/5/task
        [HttpPost("{id:int}")]
        public async Task AddTask([FromBody] TaskViewModel taskViewModel)
        {
            await _taskService.InsertTask(taskViewModel);
        }

        // PUT api/tasks/5/task/2
        [HttpPut("{id:int}")]
        public async Task UpdateTask([FromBody] TaskViewModel taskViewModel)
        {
            await _taskService.UpdateTask(taskViewModel);
        }
        // DELETE api/tasks/3/task/2
        [HttpDelete("{id:int}")]
        public void DeleteTask(int id)
        {
            _taskService.DeleteTask(id);
        }

    }
}