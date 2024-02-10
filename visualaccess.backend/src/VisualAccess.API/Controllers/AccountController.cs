using System;
using System.Security.Claims;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.Contexts;
using VisualAccess.API.RequestModels.AccountModels;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/[controller]")]
    [Authorize(Policy = "AccountRequest")]
    public class AccountController : ControllerBase
    {
        private readonly ILog log;
        private readonly IAccountRepository accountRepository;
        private readonly IAccountValidator accountValidator;
        private readonly IGenericMapper mapper;

        public AccountController(ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, IGenericMapper mapper)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.mapper = mapper;
        }

        [HttpGet("info")]
        public Task<IActionResult> Get()
        {
            Account? account = HttpContext.GetAccount();
            if (account is null)
            {
                log.Error("Account was not found in token claims.");
                return Task.FromResult<IActionResult>(StatusCode(401, new { message = "Invalid token" }));
            }

            var response = new
            {
                account.Username,
                account.FirstName,
                account.LastName,
                account.Email,
                account.Address,
                account.PhoneNumber,
                account.FaceID,
                account.AllowedRooms,
                role = account.Role.ToString()
            };

            return Task.FromResult<IActionResult>(StatusCode(200, response));
        }

        [HttpPut("password")]
        public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordRequestModel request)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            Account? account = HttpContext.GetAccount();
            if (account is null)
            {
                log.Error("Account was not found in token claims.");
                return StatusCode(401, new { message = "Invalid token" });
            }

            ResetPasswordService resetPasswordService = new(account, accountRepository, accountValidator, mapper);
            var response = await resetPasswordService.Execute(request.OldPassword!, request.NewPassword!, request.ConfirmedPassword!);

            switch (response)
            {
                case ServiceResult.INVALID_OPERATION:
                    return StatusCode(400, new { message = "[newPassword] must be same as [confirmedPassword]" });
                case ServiceResult.SAME_PASSWORD:
                    return StatusCode(400, new { message = "[newPassword] must be diffrent from [oldPassword]" });
                case ServiceResult.WRONG_PASSWORD:
                    return StatusCode(400, new { message = "Invalid credential" });
                case ServiceResult.ACCOUNT_NOT_FOUND:
                    return StatusCode(401, new { message = "Invalid token" });
                case ServiceResult.DATABASE_ERROR:
                    return StatusCode(500, new { message = "Somthing went wrong" });
            }

            return StatusCode(200, new { });
        }
    }
}

