

using Sample.Core.Http;
using Sample.Entities.Models;
using Sample.Entities.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sample.Entities.Services
{
    public interface IUserService : IBaseService<User>
    {
        Task<HttpResponse<List<UserViewModel>>> GetAllUsers();
        Task<HttpResponse<List<UserViewModel>>> GetUsersById(int taskId);
    }
}
