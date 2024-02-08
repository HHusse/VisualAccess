using System;
using System.Security.Claims;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/[controller]")]
    public class AccountController : ControllerBase
    {
        private readonly ILog log;
        private readonly IAccountRepository accountRepository;
        private readonly IGenericMapper mapper;

        public AccountController(ILog log, IAccountRepository accountRepository, IGenericMapper mapper)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.mapper = mapper;
        }

        [HttpGet("info")]
        [Authorize]
        public async Task<IActionResult> Get()
        {
            string username = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier)!.Value;

            GetService service = new(accountRepository, mapper);
            var result = await service.Execute(username);

            if (result.Item1 != ServiceResult.OK)
            {
                switch (result.Item1)
                {
                    case ServiceResult.ACCOUNT_NOT_FOUND:
                        return StatusCode(404, new { message = "Account with provided username not found" });
                }
            }

            Account account = result.Item2!;

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

            return StatusCode(200, response);
        }
    }
}

