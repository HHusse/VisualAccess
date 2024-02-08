using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.API.RequestModels.ManageRoomModels;
using VisualAccess.Business.Services.ManageRoomServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/manage/room")]
    public class ManageRoomController : ControllerBase
    {
        private readonly ILog log;
        private readonly IRoomRepository roomRepository;
        private readonly IAccountRepository accountRepository;
        private readonly IRoomFactory roomFactory;
        private readonly IGenericMapper mapper;

        public ManageRoomController(ILog log, IRoomRepository roomRepository, IAccountRepository accountRepository, IRoomFactory roomFactory, IGenericMapper mapper)
        {
            this.log = log;
            this.roomRepository = roomRepository;
            this.accountRepository = accountRepository;
            this.roomFactory = roomFactory;
            this.mapper = mapper;
        }

        [HttpPost("register")]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> Register([FromBody] RegisterRoomRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }
            Room newRoom = roomFactory.Create(requestModel.Name!, requestModel.Password!, DateTimeOffset.Now.ToUnixTimeSeconds());
            RegisterService service = new(roomRepository);
            ServiceResult result = await service.Execute(newRoom);

            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.ROOM_ALREADY_EXIST:
                        return StatusCode(400, new { message = "Room with provided name already exist" });
                    case ServiceResult.DATABASE_ERROR:
                        return StatusCode(500, new { message = "Something went wrong" });
                }
            }

            return StatusCode(200, new { });
        }

        [HttpDelete]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> Remove([FromBody] RemoveRoomRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            RemoveService service = new(roomRepository, accountRepository, mapper);
            ServiceResult result = await service.Execute(requestModel.Name!);

            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.ROOM_NOT_FOUND:
                        return StatusCode(404, new { message = "Room with provided name not found" });
                    case ServiceResult.DATABASE_ERROR:
                        return StatusCode(500, new { message = "Something went wrong" });
                }
            }

            return StatusCode(200, new { });
        }
    }
}

