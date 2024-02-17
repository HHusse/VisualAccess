using System;
using Amazon.Auth.AccessControlPolicy;
using AutoMapper;
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
        private readonly IGenericMapper mapper;

        public RequestRoomPermissionController(ILog log, IAccountRepository accountRepository, IRequestRoomPermissionRepository requestRoomPermissionRepository, IRoomRepository roomRepository, IRequestRoomPermissionFactory factory, IGenericMapper mapper)
        {
            this.log = log;
            this.accountRepository = accountRepository;
            this.requestRoomPermissionRepository = requestRoomPermissionRepository;
            this.roomRepository = roomRepository;
            this.factory = factory;
            this.mapper = mapper;
        }

        [HttpPost]
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
            CreateService service = new(accountRepository, roomRepository, requestRoomPermissionRepository, mapper);
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
    }
}

