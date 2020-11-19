

using Sample.Entities.Models;
using Sample.Entities.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sample.Entities.Services
{
    public interface ITaskService : IBaseService<ProjectTask>
    {
        Task InsertTask(TaskViewModel taskViewModel);
        Task UpdateTask(TaskViewModel taskViewModel, int id);
        void DeleteTask(int id);
        Task InsertListTask(ListTaskViewModel listTaskViewModel);
        Task UpdateListTask(ListTaskViewModel listTaskViewModel, int id);
        void DeleteListTask(int id);
    }
}
