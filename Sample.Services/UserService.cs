using DevExtreme.AspNet.Data;
using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.Services;
using Sample.Entities.UnitOfWork;
using Sample.Entities.ViewModels;
using Sample.Repositories;
using Sample.Repositories.Repostitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sample.Services
{
    public class UserService : BaseService<User>, IUserService
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserService(IUnitOfWork unitOfWork): base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<HttpResponse<List<UserViewModel>>> GetAllUsers()
        {
            var users = await Repository.GetAllUsers();
            return users;
        }
        public async Task<HttpResponse<List<UserViewModel>>> GetUsersById(int taskId)
        {
            var repos = _unitOfWork.Repository<TaskProject>();
            var users = await repos.GetUsersById(taskId);
            return users;
        }
    }
}
