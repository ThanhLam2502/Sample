using Microsoft.EntityFrameworkCore;
using Sample.Core.Http;
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
        public static async Task<HttpResponse<List<ProjectTaskViewModel>>> GetProjects(this IRepository<Project> repository)
        {
            var query = await repository.Entities
                .Where(project => project.IsDeleted != true)
                .Select(project => new ProjectTaskViewModel
                {
                    Id = project.Id,
                    Name = project.Name,
                    StartDate = project.StartDate,
                    EndDate = project.EndDate,
                    Status = project.Status,
                    AssignTo = project.AssignTo,
                    Tasks = project.ListTask.Select(lstask => new ListTaskViewModel
                    {
                        Id = lstask.Id,
                        Name = lstask.Name,
                        ProjectId = lstask.ProjectId,
                        Task = lstask.TaskProject.Select(task => new TaskViewModel
                        {
                            Id = task.Id,
                            Name = task.Name,
                            Description = task.Description,
                            AttachFiles = task.AttachFiles,
                            Status = task.Status,
                            ListTaskId = task.ListTaskId,
                        })
                    })
                }).ToListAsync();
            return HttpResponse<List<ProjectTaskViewModel>>.OK(query);
        }
    }
}
