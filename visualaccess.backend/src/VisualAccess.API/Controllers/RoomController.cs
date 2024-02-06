using System;
using log4net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Business.Services.RoomServices;
using VisualAccess.API.RequestModels.RoomModels;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.FaceRecognition.Services;
using VisualAccess.Domain.Interfaces.ServicesClient;

namespace VisualAccess.API.Controllers
{
    [Route("api/v1/[controller]")]
    public class RoomController : ControllerBase
    {
        private readonly ILog log;
        private readonly IRoomRepository roomRepository;
        private readonly IEntranceRecordRepository entranceRecordRepository;
        private readonly IAccountRepository accountRepository;
        private readonly IFaceRecognitionServiceClient faceRecognitionClient;

        public RoomController(ILog log, IRoomRepository roomRepository, IEntranceRecordRepository entranceRecordRepository, IAccountRepository accountRepository, IFaceRecognitionServiceClient faceRecognitionClient)
        {
            this.log = log;
            this.roomRepository = roomRepository;
            this.entranceRecordRepository = entranceRecordRepository;
            this.accountRepository = accountRepository;
            this.faceRecognitionClient = faceRecognitionClient;
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

        [HttpPost("access")]
        [Authorize(Roles = "ADMIN")]
        public async Task<IActionResult> Access([FromForm] RoomAccessRequestModel requestModel)
        {
            if (!ModelState.IsValid)
            {
                log.Error($"Wrong body request");
                return BadRequest(ModelState);
            }

            var faceStream = new MemoryStream();
            await requestModel.FaceImg!.CopyToAsync(faceStream);
            faceStream.Position = 0;

            VerifyFaceService service = new(accountRepository, faceRecognitionClient, roomRepository, entranceRecordRepository);
            ServiceResult result = await service.Execute(faceStream, requestModel.RoomName!);

            if (result != ServiceResult.OK)
            {
                switch (result)
                {
                    case ServiceResult.ROOM_NOT_FOUND:
                        return StatusCode(404, new { message = "Room with provided name not found" });
                    case ServiceResult.ACCOUNT_NOT_FOUND:
                        return StatusCode(404, new { message = "Account with this face not found" });
                    case ServiceResult.FACE_NOT_FOUND:
                        return StatusCode(404, new { message = "No face found in request image" });
                    case ServiceResult.FACE_NOT_REGISTERD:
                        return StatusCode(403, new { message = "Face not registerd" });
                    case ServiceResult.ACCOUNT_HAS_NO_PERMISSION:
                        return StatusCode(403, new { message = "Account has no permission in this room" });
                    case ServiceResult.DATABASE_ERROR:
                        return StatusCode(500, new { message = "Something went wrong" });
                }
            }

            return StatusCode(200, new { });
        }
    }
}

