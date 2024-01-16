using System;
using log4net;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels;
using VisualAccess.Business.Services.Authentication;
using VisualAccess.DataAccess.Context;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;


namespace VisualAccess.API.Controllers
{
    [Route("api/v1")]
    public class AuthenticationController : ControllerBase
    {
        private readonly VisualAccessDbContext dbContext;
        private readonly ILog log;
        private IAccountRepository accountRepository;
        private IAccountValidator accountValidator;
        private ITokenFactory tokenFactory;

        public AuthenticationController(VisualAccessDbContext dbContext, ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, ITokenFactory tokenFactory)
        {
            this.dbContext = dbContext;
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.tokenFactory = tokenFactory;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            LoginService service = new(dbContext, accountRepository, accountValidator, tokenFactory);
            Result result = await service.Execute(requestModel.Username!, requestModel.Password!);

            return result.Succed ? StatusCode(200, new { token = result.Message }) : StatusCode(401);
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            RegisterService service = new(dbContext, accountRepository, accountValidator);
            Account newAccount = new(requestModel.FirstName!, requestModel.LastName!, requestModel.Username!, requestModel.Email!, requestModel.Password!, requestModel.Address!, requestModel.PhoneNumber!, requestModel.Role!);
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

