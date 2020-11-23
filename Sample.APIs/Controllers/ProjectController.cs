using Microsoft.AspNetCore.Mvc;
using Sample.Entities.Resources;
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
        public async Task<IActionResult> AddProject([FromBody] ProjectTaskViewModel data)
        {

            await _projectService.InsertProject(data);
            return Ok(new
            {
                message = Messages.ItemInserted,
                data
            });
        }


        [HttpPut]
        public async Task<IActionResult> UpdateProject([FromBody] ProjectTaskViewModel data)
        {
            int update = await _projectService.UpdateProject(data);
            if (update < 0)
                return NoContent();
            return Ok(new
            {
                message = Messages.ItemUpdated,
                data,
            });
        }

        // DELETE api/projects/5
        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteProject(int id)
        {
            int delete = await _projectService.DeleteProject(id);
            if (delete < 0)
                return NoContent();
            return Ok(new
            {
                message = Messages.ItemDeleted
            });
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