using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels;
using VisualAccess.Business.Services;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.FaceRecognition.Services;
using static VisualAccess.API.Controllers.ApiController;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1")]
    public class RegisterController : ControllerBase
    {
        private readonly ILog log;
        private readonly IAccountRepository accountRepository;
        private readonly IAccountValidator accountValidator;
        private readonly IFaceRecognitionServiceClient faceRecognitionClient;

        public RegisterController(ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, IFaceRecognitionServiceClient faceRecognitionClient)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.faceRecognitionClient = faceRecognitionClient;
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

            string fileExtension = Path.GetExtension(requestModel.FaceImg.FileName);
            string contentType = requestModel.FaceImg.ContentType;

            RegisterFaceService service = new(accountRepository, faceRecognitionClient);
            Result result = await service.Execute(requestModel.Username!, faceStream, contentType, fileExtension);
            if (!result.Succed)
            {
                switch (result.Code)
                {
                    case 1:
                        return StatusCode(404, new { message = result.Message });
                    case 2:
                    case 4:
                        return StatusCode(500, new { message = result.Message });
                    case 3:
                        return StatusCode(502, new { message = result.Message });
                }
            }

            return StatusCode(200);
        }
    }
}

