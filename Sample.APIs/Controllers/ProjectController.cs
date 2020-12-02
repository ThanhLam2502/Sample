using Microsoft.AspNetCore.Mvc;
using Sample.Entities.Services;
using Sample.Entities.ViewModels;
using System.Threading.Tasks;

namespace Sample.APIs.Controllers
{
    [Route("api/projects")]
    [ApiController]
    public class ProjectController : BaseApiController
    {
        private readonly IProjectService _projectService;

        public ProjectController(IProjectService projectService)
        {
            _projectService = projectService;
        }

        // GET: api/projects
        [HttpGet]
        public async Task<IActionResult> GetProjects()
        {
            var response = await _projectService.GetProjects();
            return StatusCode(response);
        }

        [HttpPost]
        public async Task<IActionResult> InsertProject([FromBody] ProjectTaskViewModel model)
        {
            var response = await _projectService.InsertProject(model);
            return StatusCode(response);
        }


        [HttpPut]
        public async Task<IActionResult> UpdateProject([FromBody] ProjectTaskViewModel model)
        {
            var response = await _projectService.UpdateProject(model);
            return StatusCode(response);
        }

        // DELETE api/projects/5
        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteProjectAsync(int id)
        {
            var response = await _projectService.DeleteProject(id);
            return StatusCode(response);
        }

    }

}
//[HttpGet]
//public async Task<IEnumerable<Project>> GetProjects()
//{
//    return await _projectService.GetAllAsync();
//}
// GET: api/project

// GET: api/projects/listtask
//[HttpGet("{id:int}/tasks")]
//public IActionResult GetListTasks([FromRoute] int id)
//{
//    var listTask = _projectService.GetListTaskAsync(id);
//    return Ok(listTask.Result);
//}