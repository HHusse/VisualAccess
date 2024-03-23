using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.Contexts;
using VisualAccess.API.RequestModels.ManageAccountModels;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Business.Services.ManageAccountServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.FaceRecognition.Services;
using VisualAccess.Utils;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/manage/account")]
    [Authorize(Policy = "AccountRequest")]
    public class ManageAccountController : ControllerBase
    {
        private readonly ILog log;
        private readonly IAccountRepository accountRepository;
        private readonly IAccountValidator accountValidator;
        private readonly IFaceRecognitionServiceClient faceRecognitionClient;
        private readonly IFaceRepository faceRepository;
        private readonly IRoomRepository roomRepository;
        private readonly IAccountFactory accountFactory;
        private readonly IGenericMapper mapper;

        public ManageAccountController(ILog log, IAccountRepository accountRepository, IAccountValidator accountValidator, IFaceRecognitionServiceClient faceRecognitionClient, IFaceRepository faceRepository, IRoomRepository roomRepository, IAccountFactory accountFactory, IGenericMapper mapper)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.accountValidator = accountValidator;
            this.faceRecognitionClient = faceRecognitionClient;
            this.faceRepository = faceRepository;
            this.roomRepository = roomRepository;
            this.accountFactory = accountFactory;
            this.mapper = mapper;
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

            if (!Enum.TryParse<Role>(requestModel.Role, out var accountRole))
            {
                return StatusCode(400, new { message = "Invalid role value" });
            }

            Account? account = HttpContext.GetAccount();
            if (account is null)
            {
                log.Error("Account was not found in token claims.");
                return StatusCode(401, new { message = "Invalid token" });
            }

            string generatedPassword = PasswordGenerator.Create();
            Account newAccount = accountFactory.Create(requestModel.FirstName!, requestModel.LastName!, requestModel.Username!, requestModel.Email!, generatedPassword, requestModel.Address!, requestModel.PhoneNumber!, accountRole, DateTimeOffset.Now.ToUnixTimeSeconds());
            RegisterAccountService service = new(accountRepository, accountValidator);
            ServiceResult result = await service.Execute(account, newAccount, generatedPassword);
            switch (result)
            {
                case ServiceResult.INVALID_OPERATION:
                    return StatusCode(400, new { message = "You don't have permission to register this account" });
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
                case ServiceResult.FAIL_TO_SEND_EMAIL:
                    return StatusCode(500, new { message = "Fail to send welcome email" });

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

            RegisterFaceService service = new(accountRepository, faceRecognitionClient, mapper);
            ServiceResult result = await service.Execute(requestModel.Username!, faceStream);
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

            Account? account = HttpContext.GetAccount();
            if (account is null)
            {
                log.Error("Account was not found in token claims.");
                return StatusCode(401, new { message = "Invalid token" });
            }

            RemoveAccountService service = new(accountRepository, faceRepository, mapper, faceRecognitionClient);
            ServiceResult result = await service.Execute(account, requestModel.Username!);

            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.INVALID_OPERATION:
                        return StatusCode(400, new { message = "You don't have permission to remove this account" });
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

            AddRoomPremissionService service = new(accountRepository, roomRepository, mapper);
            ServiceResult result = await service.Execute(requestModel.Username!, requestModel.RoomName!);

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
                case ServiceResult.ROOM_PERMISSION_ALREADY_EXIST:
                    return StatusCode(400, new { message = "Account already has permission in the room" });
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

            RemoveRoomPermissionService service = new(accountRepository, roomRepository, mapper);
            ServiceResult result = await service.Execute(requestModel.Username!, requestModel.RoomName!);

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
            return StatusCode(200, new { });
        }

        [HttpGet("/api/v1/manage/accounts/{page}")]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> GetAccounts([FromRoute] int page)
        {

            GetAccountsByPageService service = new(accountRepository, mapper);
            var result = await service.Execute(page);

            switch (result.Item1)
            {
                case ServiceResult.NOT_FOUND:
                    return StatusCode(404, new { message = "No accounts found for the requested page" });
            }

            var accounts = result.Item2!.Select(account => new
            {
                account.Username,
                account.FirstName,
                account.LastName,
                account.Email,
                account.Address,
                account.PhoneNumber,
                account.FaceID,
                account.AllowedRooms,
                account.TemporaryRoomPermissions,
                role = account.Role.ToString()
            });

            var response = new
            {
                maxPages = result.Item3,
                accounts
            };
            return StatusCode(200, response);
        }

        [HttpGet]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> GetAccount([FromQuery] GetAccountRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            GetAccountService service = new(accountRepository, mapper);
            var result = await service.Execute(requestModel.Username!);

            switch (result.Item1)
            {
                case ServiceResult.ACCOUNT_NOT_FOUND:
                    return StatusCode(404, new { message = "Account with provided username not found" });
                case ServiceResult.DATABASE_ERROR:
                    return StatusCode(500, new { message = "Something went wrong" });
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
                account.TemporaryRoomPermissions,
                role = account.Role.ToString()
            };
            return StatusCode(200, response);
        }
    }
}

