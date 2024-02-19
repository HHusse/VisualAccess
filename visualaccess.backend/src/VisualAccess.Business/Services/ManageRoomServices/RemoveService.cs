using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.DataAccess.Repositories;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.ManageRoomServices
{
    public class RemoveRoomService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RemoveRoomService));
        private readonly IRoomRepository roomRepository;
        private readonly IAccountRepository accountRepository;
        private readonly IGenericMapper mapper;

        public RemoveRoomService(IRoomRepository roomRepository, IAccountRepository accountRepository, IGenericMapper mapper)
        {
            this.roomRepository = roomRepository;
            this.accountRepository = accountRepository;
            this.mapper = mapper;
        }

        public async Task<ServiceResult> Execute(string roomName)
        {
            RoomDTO? roomDTO = (RoomDTO?)await roomRepository.GetRoom(roomName);
            if (roomDTO is null)
            {
                log.Warn($"Room with name {roomName.ToLower()} dosen't exist");
                return ServiceResult.ROOM_NOT_FOUND;
            }
            Room room = mapper.Map<RoomDTO, Room>(roomDTO);

            DatabaseResult removeResult = await roomRepository.RemoveRoom(room);
            if (removeResult == DatabaseResult.UNKNOWN_ERROR)
            {
                return ServiceResult.DATABASE_ERROR;
            }

            DatabaseResult cleanupResult = await accountRepository.CleanupPermissionsAfterRoomRemoval(room.Name);
            if (cleanupResult == DatabaseResult.UNKNOWN_ERROR)
            {
                return ServiceResult.DATABASE_ERROR;
            }
            return ServiceResult.OK;
        }
    }
}

