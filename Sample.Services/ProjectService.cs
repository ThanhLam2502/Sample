using AutoMapper;
using Microsoft.AspNetCore.Http;
using Sample.Entities.Models;
using Sample.Entities.Services;
using Sample.Entities.UnitOfWork;
using Sample.Entities.ViewModels;
using Sample.Repositories.Repostitory;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sample.Services
{
    public class ProjectService : BaseService<Project>, IProjectService
    {
        private readonly IMapper _mapper;
        private readonly IUnitOfWork _unitOfWork;

        public ProjectService(IUnitOfWork unitOfWork, IMapper mapper) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<int> DeleteProject(int id)
        {
            var project = await Repository.FindAsync(id);
            if (project != null)
            {
                Repository.Delete(id);
                return 1;
            }
            return -1;
        }

        public async Task<List<ProjectTaskViewModel>> GetProjects()
        {
            var projects = await Repository.GetProjects();
            return projects;
        }

        public async Task InsertProject(ProjectTaskViewModel data)
        {
            var project = _mapper.Map<Project>(data);
            await Repository.InsertAsync(project);
        }

        public async Task<int> UpdateProject(ProjectTaskViewModel data)
        {
            var project = Repository.Find(data.Id);
            if (project != null)
            {
                //project = _mapper.Map<Project>(data);
                //repos.Update(project);
                project.Name = data.Name;
                project.StartDate = data.StartDate;
                project.EndDate = data.EndDate;
                project.AssignTo = data.AssignTo;
                project.Status = data.Status;
                await _unitOfWork.SaveChangesAsync();

                return 1;
            }
            return -1;
        }
    }
}
//public async Task<IEnumerable<Project>> GetProjects()
//{
//    var repos = _unitOfWork.Repository<Project>();
//    return await repos.GetProjects();
//}

//public void Update(Project entity)
//{
//    //throw new NotImplementedException();

//    try
//    {
//        _unitOfWork.BeginTransaction();

//        _unitOfWork.CommitTransaction();

//    }
//    catch (Exception)
//    {
//        _unitOfWork.RollbackTransaction();
//        throw;
//    }
//    var a = _unitOfWork.Repository<Project>();
//    a.MyTest();
//    Repository.Find
//}