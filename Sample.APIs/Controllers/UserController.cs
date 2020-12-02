﻿using Microsoft.AspNetCore.Mvc;
using Sample.Entities.Services;
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

        // GET: api/users
        [HttpGet]
        public async Task<IActionResult> GetAllUsers()
        {
            var response = await _userService.GetAllUsers();
            return StatusCode(response);
        }

        [HttpGet("task/{id:int}")]
        public async Task<IActionResult> GetUsersByTaskId([FromRoute] int id)
        {
            var response = await _userService.GetUsersByTaskId(id);
            return StatusCode(response);
        }
    }
}