using AutoMapper;
using Microsoft.AspNetCore.Http;
using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.Resources;
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

        public async Task<HttpResponse<List<ProjectTaskViewModel>>> GetProjects()
        {
            var projects = await Repository.GetProjects();
            return projects;
        }

        public async Task<HttpResponse<int>> InsertProject(ProjectTaskViewModel model)
        {
            var project = _mapper.Map<Project>(model);
            await Repository.InsertAsync(project);
            return HttpResponse<int>.OK(project.Id, Messages.ItemInserted);
        }

        public async Task<HttpResponse<int>> DeleteProject(int id)
        {
            var project = await Repository.FindAsync(id);
            if (project == null)
                return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.NoContent);

            project.IsDeleted = true;
            var saved = await _unitOfWork.SaveChangesAsync();
            if (saved > 0)
                return HttpResponse<int>.OK(id, Messages.ItemDeleted);

            return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.BadRequest);

        }

        public async Task<HttpResponse<int>> UpdateProject(ProjectTaskViewModel model)
        {
            var project = await Repository.FindAsync(model.Id);
            if (project == null)
                return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.NoContent);

            project.Name = model.Name;
            project.StartDate = model.StartDate;
            project.EndDate = model.EndDate;
            project.AssignTo = model.AssignTo;
            project.Status = model.Status;

            int saved = await _unitOfWork.SaveChangesAsync();

            if (saved > 0)
                return HttpResponse<int>.OK(project.Id, Messages.ItemUpdated);

            return HttpResponse<int>.Error(Messages.ActionFailed, statusCode: System.Net.HttpStatusCode.BadRequest);
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