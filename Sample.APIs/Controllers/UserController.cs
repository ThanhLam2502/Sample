using Microsoft.AspNetCore.Mvc;
using Sample.Entities.Models;
using Sample.Entities.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sample.APIs.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UserController : BaseApiController
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        // GET: api/user
        [HttpGet]
        public async Task<IEnumerable<User>> GetAllAsync()
        {
            return await _userService.GetAllAsync();
        }
    }
}