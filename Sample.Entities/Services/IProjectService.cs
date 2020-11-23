

using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sample.Entities.Services
{
    public interface IProjectService : IBaseService<Project>
    {
        Task<HttpResponse<List<ProjectTaskViewModel>>> GetProjects();
        Task InsertProject(ProjectTaskViewModel data);
        Task<int> UpdateProject(ProjectTaskViewModel data);
        Task<int> DeleteProject(int id);
    }
}
