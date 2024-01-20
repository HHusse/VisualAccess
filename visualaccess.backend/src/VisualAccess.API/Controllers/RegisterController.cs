using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels;
using VisualAccess.Business.Services;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1")]
    public class RegisterController : ControllerBase
    {
        private readonly ILog log;
        private IAccountRepository accountRepository;
        private IAccountValidator accountValidator;

        public RegisterController(ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
        }


        [HttpPost("register")]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> Register([FromBody] RegisterRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            RegisterService service = new(accountRepository, accountValidator);
            Account newAccount = new(requestModel.FirstName!, requestModel.LastName!, requestModel.Username!.ToLower(), requestModel.Email!.ToLower(), requestModel.Password!, requestModel.Address!, requestModel.PhoneNumber!, requestModel.Role!);
            Result result = await service.Execute(newAccount);
            if (!result.Succed)
            {
                if (result.Message == "Database Error")
                {
                    return StatusCode(500, new { message = result.Message });
                }
                return StatusCode(400, new { message = result.Message });
            }
            return StatusCode(200);
        }
    }
}

