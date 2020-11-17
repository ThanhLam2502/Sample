using Microsoft.EntityFrameworkCore;
using Sample.Entities.Models;
using Sample.Entities.Repositories;
using Sample.Entities.ViewModels;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sample.Repositories.Repostitory
{
    public static class ProjectRepository
    {
        public static async Task<List<ProjectTaskViewModel>> GetProjects(this IRepository<Project> repository)
        {
            var query = repository.Entities.Select(p => new ProjectTaskViewModel
            {
                Id = p.Id,
                Name = p.Name,
                StartDate = p.StartDate,
                EndDate = p.EndDate,
                Status = p.Status,
                AssignTo = p.AssignTo,
                Tasks = p.ListTask.Select(ls => new ListTaskViewModel
                {
                    Id = ls.Id,
                    Name = ls.Name,
                    ProjectId = ls.ProjectId,
                    Task = ls.ProjectTask.Select(t => new TaskViewModel
                    {
                        Id = t.Id,
                        Name = t.Name,
                        Description = t.Description,
                        AttachFiles = t.AttachFiles,
                        Status = t.Status,
                        ListTaskId = t.ListTaskId,
                    })
                })
            });
            return await query.ToListAsync();
        }
    }
}
