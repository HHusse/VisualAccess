using System;
using Amazon.Auth.AccessControlPolicy;
using AutoMapper;
using Grpc.Core;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.Contexts;
using VisualAccess.API.RequestModels.AccountModels;
using VisualAccess.API.RequestModels.RequestRoomPermissionModels;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Business.Services.RequestRoomPermissionServices;
using VisualAccess.Business.Validators;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/request/permission/room")]
    [Authorize(Policy = "AccountRequest")]
    public class RequestRoomPermissionController : ControllerBase
    {
        private readonly ILog log;
        private readonly IAccountRepository accountRepository;
        private readonly IRequestRoomPermissionRepository requestRoomPermissionRepository;
        private readonly IRoomRepository roomRepository;
        private readonly IRequestRoomPermissionFactory factory;
        private readonly ITemporaryRoomPermissionFactory temporaryRoomPermissionFactory;
        private readonly INotificationFactory notificationFactory;
        private readonly IRequestDecisionsRepository requestDecisionsRepository;
        private readonly IGenericMapper mapper;

        public RequestRoomPermissionController(ILog log, IAccountRepository accountRepository, IRequestRoomPermissionRepository requestRoomPermissionRepository, IRoomRepository roomRepository, IRequestRoomPermissionFactory factory, ITemporaryRoomPermissionFactory temporaryRoomPermissionFactory, INotificationFactory notificationFactory, IRequestDecisionsRepository requestDecisionsRepository, IGenericMapper mapper)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.requestRoomPermissionRepository = requestRoomPermissionRepository;
            this.roomRepository = roomRepository;
            this.factory = factory;
            this.temporaryRoomPermissionFactory = temporaryRoomPermissionFactory;
            this.notificationFactory = notificationFactory;
            this.requestDecisionsRepository = requestDecisionsRepository;
            this.mapper = mapper;
        }

        [HttpPost("register")]
        public async Task<IActionResult> CreateRequestRoomPermission([FromBody] CreateRequestRoomPermissionRequestModel request)
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
            if (!Enum.TryParse<RequestRoomPermissionType>(request.Type, out var type))
            {
                return StatusCode(400, new { message = "Invalid type value" });
            }

            RequestRoomPermission requestRoomPermission = factory.Create(type, request.RoomName!, request.Message);
            CreateRequestRoomPermissionService service = new(roomRepository, requestRoomPermissionRepository, mapper);
            var response = await service.Execute(requestRoomPermission, account);

            switch (response)
            {
                case ServiceResult.REQUEST_ALREADY_EXIST:
                    return StatusCode(400, new { message = "Request room permission already exist" });
                case ServiceResult.ROOM_NOT_FOUND:
                    return StatusCode(400, new { message = "Room with provided name was not found" });
                case ServiceResult.ROOM_PERMISSION_ALREADY_EXIST:
                    return StatusCode(400, new { message = "Room permision already exist" });
                case ServiceResult.DATABASE_ERROR:
                    return StatusCode(500, new { message = "Somthing went wrong" });
            }

            return StatusCode(200, new { });
        }

        [HttpGet("/api/v1/requests/permission/room/{page}")]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> GetRequests([FromRoute] int page)
        {
            GetRequestRoomPermissionsByPageService service = new(requestRoomPermissionRepository, mapper);
            var result = await service.Execute(page);

            switch (result.Item1)
            {
                case ServiceResult.NOT_FOUND:
                    return StatusCode(404, new { message = "No requests found for the requested page" });
            }

            var requests = result.Item2!.Select(request => new
            {
                request.Id,
                type = request.Type.ToString(),
                request.Username,
                request.RoomName,
                request.RequestMessage
            });

            var response = new
            {
                maxPages = result.Item3,
                requests
            };
            return StatusCode(200, response);
        }

        [HttpPost]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> AcceptRequest([FromBody] AcceptRequestRoomPermissionRequestModel requestModel)
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

            AcceptRequestRoomPermissionService service = new(accountRepository, requestRoomPermissionRepository, temporaryRoomPermissionFactory, notificationFactory, requestDecisionsRepository, mapper);
            ServiceResult response = await service.Execute(account, requestModel.RequestId!, requestModel.Days);
            switch (response)
            {
                case ServiceResult.REQUEST_NOT_FOUND:
                    return StatusCode(400, new { message = "Request room permission not found" });
                case ServiceResult.ACCOUNT_NOT_FOUND:
                    return StatusCode(400, new { message = "Account associated to this request room permission not found" });
                case ServiceResult.INVALID_OPERATION:
                    return StatusCode(400, new { message = "For this request room permission you need to provide [days], beacuse is a temporary access permision" });
                case ServiceResult.DATABASE_ERROR:
                case ServiceResult.UNKNOWN_ERROR:
                    return StatusCode(500, new { message = "Somthing went wrong" });
            }

            return StatusCode(200, new { });
        }

        [HttpDelete]
        [Authorize(Roles = "ADMIN,HR")]
        public async Task<IActionResult> DeniedRequest([FromBody] DeniedRequestRoomPermissionModel requestModel)
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

            RemoveRequestRoomPermissionService service = new(accountRepository, requestRoomPermissionRepository, notificationFactory, requestDecisionsRepository, mapper);
            ServiceResult response = await service.Execute(account, requestModel.RequestId!);
            switch (response)
            {
                case ServiceResult.REQUEST_NOT_FOUND:
                    return StatusCode(400, new { message = "Request room permission couldn't be found" });
                case ServiceResult.ACCOUNT_NOT_FOUND:
                    return StatusCode(400, new { message = "Account associated to this request room permission couldn't be found" });
                case ServiceResult.DATABASE_ERROR:
                    return StatusCode(500, new { message = "Somthing went wrong" });
            }

            return StatusCode(200, new { });
        }
    }
}