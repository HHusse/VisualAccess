using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.Business.Services.RoomServices
{
    public class RegisterService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterService));
        private readonly IRoomRepository repository;

        public RegisterService(IRoomRepository repository)
        {
            this.repository = repository;
        }

        public async Task<ServiceResult> Execute(Room room)
        {
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

