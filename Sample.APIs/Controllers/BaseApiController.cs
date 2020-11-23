using Microsoft.AspNetCore.Mvc;
using Sample.Core.Http;

namespace Sample.APIs.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BaseApiController : ControllerBase
    {
        [NonAction]
        public virtual ActionResult StatusCode(IHttpResponse response)
        {
            return StatusCode(response.StatusCode, response);
        }
    }
}
