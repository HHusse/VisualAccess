using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.ManageRoomServices
{
    public class RegisterRoomService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterRoomService));
        private readonly IRoomRepository repository;

        public RegisterRoomService(IRoomRepository repository)
        {
            this.repository = repository;
        }

        public async Task<ServiceResult> Execute(Room room)
        {
            log.Info($"Trying to register room {room.Name}");
            DatabaseResult existResult = await repository.RoomExist(room.Name);
            if (existResult == DatabaseResult.ROOM_EXIST)
            {
                return ServiceResult.ROOM_ALREADY_EXIST;
            }

            DatabaseResult result = await repository.AddNewRoom(room);
            if (result == DatabaseResult.UNKNOWN_ERROR)
            {
                return ServiceResult.DATABASE_ERROR;
            }

            return ServiceResult.OK;
        }
    }
}

