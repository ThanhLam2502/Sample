using Microsoft.AspNetCore.Mvc;
using Sample.Entities.Resources;
using Sample.Entities.Services;
using Sample.Entities.ViewModels;
using System.Threading.Tasks;

namespace Sample.APIs.Controllers
{
    [Route("api/todos")]
    [ApiController]
    public class TodoController : BaseApiController
    {
        private readonly ITodoService _todoService;

        public TodoController(ITodoService todoService)
        {
            _todoService = todoService;
        }

        // POST api/todos
        [HttpPost]
        public async Task<IActionResult> InsertListTodo([FromBody] ListTodoViewModel model)
        {
            var response = await _todoService.InsertListTodo(model);
            return StatusCode(response);
        }

        // PUT api/todos/5
        [HttpPut("{id:int}")]
        public async Task<IActionResult> UpdateListTodo([FromBody] ListTodoViewModel model, int id)
        {
            var response = await _todoService.UpdateListTodo(model, id);
            return StatusCode(response);
        }

        // DELETE api/todos/3
        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteListTodo(int id)
        {
            var response = await _todoService.DeleteListTodo(id);
            return StatusCode(response);
        }

        // POST api/todos/todo
        [HttpPost("todo")]
        public async Task<IActionResult> InsertTodo([FromBody] TodoViewModel model)
        {
            var response = await _todoService.InsertTodo(model);
            return StatusCode(response);
        }

        // PUT api/todos/todo/2
        [HttpPut("todo/{id:int}")]
        public async Task<IActionResult> UpdateTodo([FromBody] TodoViewModel model, int id)
        {
            var response = await _todoService.UpdateTodo(model, id);
            return StatusCode(response);
        }

        // DELETE api/todos/todo/2
        [HttpDelete("todo/{id:int}")]
        public IActionResult DeleteTodo(int id)
        {
            var response = _todoService.DeleteTodo(id);
            return StatusCode(response);
        }

    }
}