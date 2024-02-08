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
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;


namespace VisualAccess.API.Controllers
{
    [Route("api/v1")]
    public class AuthenticationController : ControllerBase
    {
        private readonly ILog log;
        private readonly IAccountRepository accountRepository;
        private readonly IAccountValidator accountValidator;
        private readonly ITokenFactory tokenFactory;
        private readonly IRoomRepository roomRepository;
        private readonly IRoomValidator roomValidator;
        private readonly IGenericMapper mapper;

        public AuthenticationController(ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, ITokenFactory tokenFactory, IRoomRepository roomRepository, IRoomValidator roomValidator, IGenericMapper mapper)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.tokenFactory = tokenFactory;
            this.roomRepository = roomRepository;
            this.roomValidator = roomValidator;
            this.mapper = mapper;
        }

        [HttpPost("account/login")]
        public async Task<IActionResult> LoginAccount([FromBody] LoginAccountRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            LoginAccountService service = new(accountRepository, accountValidator, tokenFactory, mapper);
            var result = await service.Execute(requestModel.Username!, requestModel.Password!);
            ServiceResult serviceResult = result.Item1;
            if (serviceResult != ServiceResult.OK)
            {
                return StatusCode(401, new { message = "Invalid credentials" });
            }

            string token = result.Item2;
            return StatusCode(200, new { token = token });
        }

        [HttpPost("room/login")]
        public async Task<IActionResult> LoginRoom([FromBody] LoginRoomRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            LoginRoomService service = new(roomRepository, roomValidator, tokenFactory, mapper);
            var result = await service.Execute(requestModel.Name!, requestModel.Password!);
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

