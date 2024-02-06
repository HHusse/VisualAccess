using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.DataAccess.Repositories;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.Business.Services.RoomServices
{
    public class RemoveService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RemoveService));
        private readonly IRoomRepository repository;

        public RemoveService(IRoomRepository repository)
        {
            this.repository = repository;
        }

        public async Task<ServiceResult> Execute(string roomName)
        {
            RoomDTO? roomDTO = (RoomDTO?)await repository.GetRoom(roomName);
            if (roomDTO is null)
            {
                log.Warn($"Room with name {roomName.ToLower()} dosen't exist");
                return ServiceResult.ROOM_NOT_FOUND;
            }
            Room room = Mapper<RoomDTO, Room>.Map(roomDTO);

            DatabaseResult result = await repository.RemoveRoom(room);
            if (result == DatabaseResult.UNKNOWN_ERROR)
            {
                return ServiceResult.DATABASE_ERROR;
            }

            return ServiceResult.OK;
        }
    }
}

