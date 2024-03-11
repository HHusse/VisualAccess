using log4net;
using Microsoft.AspNetCore.Mvc;

namespace VisualAccess.API.Controllers
{
    [ApiController]
    [Route("api")]
    public class ApiController : ControllerBase
    {
        [HttpGet("v1")]
        public Task<IActionResult> GetApiVersion()
        {
            var response = new
            {
                name = "visual access",
                apiVersion = "v1"
            };
            return Task.FromResult<IActionResult>(StatusCode(200, response));
        }
    }
}

