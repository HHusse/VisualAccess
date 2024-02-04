using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Business.Services.RoomServices;
using VisualAccess.API.RequestModels.RoomModels;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/[controller]")]
    public class RoomController : ControllerBase
    {
        private readonly ILog log;
        private readonly IRoomRepository roomRepository;

        public RoomController(ILog log, IRoomRepository roomRepository)
        {
            this.log = log;
            this.roomRepository = roomRepository;
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

            Room room = new(requestModel.Name!);
            RegisterService service = new(roomRepository);
            ServiceResult result = await service.Execute(room);

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
    }
}

