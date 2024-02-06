using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels.AuthenticationModels;
using VisualAccess.Business.Services.AuthenticationServices;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
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

        public AuthenticationController(VisualAccessDbContextPgSQL dbContext, ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, ITokenFactory tokenFactory)
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
            var result = await service.Execute(requestModel.Username!.ToLower(), requestModel.Password!);
            ServiceResult serviceResult = result.Item1;
            if (serviceResult != ServiceResult.OK)
            {
                return StatusCode(401, new { message = "Invalid credentials" });
            }

            string token = result.Item2;
            return StatusCode(200, new { token = token });
        }
    }
}

