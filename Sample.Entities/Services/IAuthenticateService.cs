using System.Threading.Tasks;
using Sample.Entities.Models;
using Sample.Entities.Models.Extensions;

namespace Sample.Entities.Services
{
    public interface IAuthenticateService
    {
        Task<AuthenticatedModel> GetUser(string identityName);
    }
}
