using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels.AccountModels;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.FaceRecognition.Services;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/[controller]")]
    public class AccountController : ControllerBase
    {
        private readonly ILog log;
        private readonly IAccountRepository accountRepository;
        private readonly IAccountValidator accountValidator;
        private readonly IFaceRecognitionServiceClient faceRecognitionClient;
        private readonly IFaceRepository faceRepository;

        public AccountController(ILog log, IAccountRepository accountRepository, IFaceRepository faceRepository, IAccountValidator accountValidator, IFaceRecognitionServiceClient faceRecognitionClient)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.faceRecognitionClient = faceRecognitionClient;
            this.faceRepository = faceRepository;
        }

        [HttpPost("register")]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> Register([FromBody] RegisterAccountRequestModel requestModel)
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
                if (result.Code == 1)
                {
                    return StatusCode(500, new { });
                }
                return StatusCode(400, new { message = result.Message });
            }
            return StatusCode(200, new { });
        }

        [HttpPost("register/face")]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> RegisterFace([FromForm] RegisterFaceRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            var faceStream = new MemoryStream();
            await requestModel.FaceImg!.CopyToAsync(faceStream);
            faceStream.Position = 0;

            RegisterFaceService service = new(accountRepository, faceRecognitionClient);
            Result result = await service.Execute(requestModel.Username!, faceStream);
            if (!result.Succed)
            {
                switch (result.Code)
                {
                    case 1:
                    case 3:
                        return StatusCode(404, new { message = result.Message });
                    case 2:
                    case 5:
                        return StatusCode(500, new { message = result.Message });
                    case 4:
                        return StatusCode(400, new { message = result.Message });
                }
            }

            return StatusCode(200, new { });
        }

        [HttpDelete]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> RemoveAccount([FromBody] RemoveRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            RemoveService service = new(accountRepository, faceRepository);
            Result result = await service.Execute(requestModel.Username!);

            if (!result.Succed)
            {
                switch (result.Code)
                {
                    case 1:
                        return StatusCode(400, new { message = result.Message });
                    case 2:
                    case 3:
                        return StatusCode(500, new { message = result.Message });
                }
            }
            return StatusCode(200, new { });
        }
    }
}

