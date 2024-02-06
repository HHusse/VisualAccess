using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels.AccountModels;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
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
        private readonly IRoomRepository roomRepository;

        public AccountController(ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, IFaceRecognitionServiceClient faceRecognitionClient, IFaceRepository faceRepository, IRoomRepository roomRepository)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.faceRecognitionClient = faceRecognitionClient;
            this.faceRepository = faceRepository;
            this.roomRepository = roomRepository;
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
            ServiceResult result = await service.Execute(newAccount);
            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.INVALID_USERNAME:
                        return StatusCode(400, new { message = "Invalid username" });
                    case ServiceResult.INVALID_EMAIL:
                        return StatusCode(400, new { message = "Invalid email address" });
                    case ServiceResult.INVALID_PHONE_NUMBER:
                        return StatusCode(400, new { message = "Invalid phone number" });
                    case ServiceResult.ACCOUNT_ALREADY_EXIST:
                        return StatusCode(400, new { message = "Account with provided username already exist" });
                    case ServiceResult.EMAIL_ALREADY_EXIST:
                        return StatusCode(400, new { message = "Account with provided email already exist" });
                    case ServiceResult.DATABASE_ERROR:
                        return StatusCode(500, new { message = "Somthing went wrong" });

                }
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
            ServiceResult result = await service.Execute(requestModel.Username!, faceStream);
            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.ACCOUNT_NOT_FOUND:
                        return StatusCode(404, new { message = "Account with provided username not found" });
                    case ServiceResult.FACE_ASSOCIATION_FAIL:
                        return StatusCode(500, "Somthing went wrong when trying to associte the face with provided username");
                    case ServiceResult.FACE_NOT_FOUND:
                        return StatusCode(400, new { message = "No face could be detected" });
                    case ServiceResult.FACE_ALREADY_EXIST:
                        return StatusCode(400, new { message = "Face already registered" });
                    case ServiceResult.UNKNOWN_ERROR:
                        return StatusCode(500, new { message = "Something went wrong" });
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
            ServiceResult result = await service.Execute(requestModel.Username!);

            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.ACCOUNT_NOT_FOUND:
                        return StatusCode(404, new { message = "Account with provided username not found" });
                    case ServiceResult.DATABASE_ERROR:
                        return StatusCode(500, new { message = "Something went wrong" });
                }
            }
            return StatusCode(200, new { });
        }

        [HttpPost("room/permission")]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> AddRoomPermision([FromBody] AddOrRemoveRoomPermissionRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            AddRoomPremissionService service = new(accountRepository, roomRepository);
            ServiceResult result = await service.Execute(requestModel.Username!, requestModel.RoomName!);

            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.ACCOUNT_NOT_FOUND:
                        return StatusCode(404, new { message = "Account with provided username was not found" });
                    case ServiceResult.ROOM_NOT_FOUND:
                        return StatusCode(404, new { message = "Room with provided name was not found" });
                    case ServiceResult.DATABASE_ERROR:
                        return StatusCode(500, new { message = "Something went wrong" });
                    case ServiceResult.INVALID_OPERATION:
                        return StatusCode(400, new { message = "Invalid operation" });
                }
            }
            return StatusCode(200, new { });
        }

        [HttpDelete("room/permission")]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> RemoveRoomPermision([FromBody] AddOrRemoveRoomPermissionRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            RemoveRoomPermissionService service = new(accountRepository, roomRepository);
            ServiceResult result = await service.Execute(requestModel.Username!, requestModel.RoomName!);

            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.ACCOUNT_NOT_FOUND:
                        return StatusCode(404, new { message = "Account with provided username was not found" });
                    case ServiceResult.ROOM_NOT_FOUND:
                        return StatusCode(404, new { message = "Room with provided name was not found" });
                    case ServiceResult.DATABASE_ERROR:
                        return StatusCode(500, new { message = "Something went wrong" });
                    case ServiceResult.INVALID_OPERATION:
                        return StatusCode(400, new { message = "Invalid operation" });
                }
            }
            return StatusCode(200, new { });
        }
    }
}

