

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
        Task<HttpResponse<int>> InsertProject(ProjectTaskViewModel model);
        Task<HttpResponse<int>> UpdateProject(ProjectTaskViewModel model);
        Task<HttpResponse<int>> DeleteProject(int id);
    }
}
