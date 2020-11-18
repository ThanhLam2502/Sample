

using Sample.Entities.Models;
using Sample.Entities.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sample.Entities.Services
{
    public interface ITaskService : IBaseService<ProjectTask>
    {
        Task InsertTask(TaskViewModel taskViewModel);
        Task UpdateTask(TaskViewModel taskViewModel);
        void DeleteTask(int id);
        Task InsertListTask(ListTaskViewModel listTaskViewModel);
        Task UpdateListTask(ListTaskViewModel listTaskViewModel);
        void DeleteListTask(int id);
    }
}
