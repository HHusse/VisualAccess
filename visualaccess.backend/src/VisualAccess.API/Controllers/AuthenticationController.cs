using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
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
        private readonly ILog log;
        private IAccountRepository accountRepository;
        private IAccountValidator accountValidator;
        private ITokenFactory tokenFactory;

        public AuthenticationController(VisualAccessDbContext dbContext, ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, ITokenFactory tokenFactory)
        {
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

            LoginService service = new(accountRepository, accountValidator, tokenFactory);
            Result result = await service.Execute(requestModel.Username!.ToLower(), requestModel.Password!);

            return result.Succed ? StatusCode(200, new { token = result.Message }) : StatusCode(401);
        }
    }
}

