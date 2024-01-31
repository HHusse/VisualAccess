using System;
using System.ComponentModel.DataAnnotations;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels;
using VisualAccess.Business.Services;
using VisualAccess.Business.Services.AccountServices;
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

        public class VerifyFaceRequestModel
        {

            [Required]
            public IFormFile? FaceImg { get; set; }
        }
        [HttpPost("verify/face")]
        public async Task<IActionResult> Verify([FromForm] VerifyFaceRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            var faceStream = new MemoryStream();
            await requestModel.FaceImg!.CopyToAsync(faceStream);
            faceStream.Position = 0;

            FaceRecognitionResult recId = await faceRecognitionClient.VerifyFaceAsync(faceStream);

            if (recId.Id != 0)
            {
                return StatusCode(200, new { id = recId });
            }

            return StatusCode(400, new { });
        }
    }
}

