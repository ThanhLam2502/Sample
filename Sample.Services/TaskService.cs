using AutoMapper;
using DevExtreme.AspNet.Data;
using Sample.Entities.Models;
using Sample.Entities.Services;
using Sample.Entities.UnitOfWork;
using Sample.Entities.ViewModels;
using Sample.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sample.Services
{
    public class TaskService : BaseService<ProjectTask>, ITaskService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public TaskService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task InsertTask(TaskViewModel taskViewModel)
        {
            var task = _mapper.Map<ProjectTask>(taskViewModel);
            await Repository.InsertAsync(task);
        }

        public async Task UpdateTask(TaskViewModel taskViewModel, int id)
        {
            var task = await Repository.FindAsync(id);
            if (task != null)
            {
                task.Name = taskViewModel.Name;
                task.Description = taskViewModel.Description;
                task.AttachFiles = taskViewModel.AttachFiles;
                task.Status = taskViewModel.Status;
                task.ListTaskId = taskViewModel.ListTaskId;
                await _unitOfWork.SaveChangesAsync();
            }
        }

        public void DeleteTask(int id)
        {
            Repository.Delete(id);
        }

        public async Task InsertListTask(ListTaskViewModel listTaskViewModel)
        {
            var listTask = _mapper.Map<ListTask>(listTaskViewModel);
            var repos = _unitOfWork.Repository<ListTask>();
            await repos.InsertAsync(listTask);
        }

        public async Task UpdateListTask(ListTaskViewModel listTaskViewModel, int id)
        {
            var repos = _unitOfWork.Repository<ListTask>();
            var listTask = await repos.FindAsync(id);
            if (listTask != null)
            {
                listTask.Name = listTaskViewModel.Name;
                listTask.ProjectId = listTaskViewModel.ProjectId;
                await _unitOfWork.SaveChangesAsync();
            }
        }

        public void DeleteListTask(int id)
        {
            var repos = _unitOfWork.Repository<ListTask>();
            repos.Delete(id);
        }
    }
}
