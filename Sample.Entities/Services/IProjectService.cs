

using Sample.Entities.Models;
using Sample.Entities.ViewModels;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sample.Entities.Services
{
    public interface IProjectService : IBaseService<Project>
    {
        Task<List<ProjectTaskViewModel>> GetProjects();
        Task<int> InsertProject(ProjectTaskViewModel data);
        Task<int> UpdateProject(ProjectTaskViewModel data);
        Task<int> DeleteProject(int id);
    }
}
