﻿using System;
using log4net;
using VisualAccess.Business.Services.ManageAccountServices;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.RoomServices
{

    public class GetRoomService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(GetRoomService));
        private readonly IRoomRepository roomRepository;
        private readonly IGenericMapper mapper;

        public GetRoomService(IRoomRepository roomRepository, IGenericMapper mapper)
        {
            this.roomRepository = roomRepository;
            this.mapper = mapper;
        }

        public async Task<(ServiceResult, Room?)> Execute(string roomName)
        {
            RoomDto? roomDTO = (RoomDto?)await roomRepository.GetRoom(roomName);
            if (roomDTO is null)
            {
                log.Warn($"Room with name {roomName.ToLower()} dosen't exist");
                return new(ServiceResult.ROOM_NOT_FOUND, null);
            }
            Room room = mapper.Map<RoomDto, Room>(roomDTO);

            return new(ServiceResult.OK, room);
        }
    }

}

