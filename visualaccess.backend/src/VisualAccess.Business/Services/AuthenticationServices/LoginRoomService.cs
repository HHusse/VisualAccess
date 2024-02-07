using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.DataAccess.Repositories;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.Business.Services.AuthenticationServices
{
    public class LoginRoomService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(LoginRoomService));
        private readonly IRoomRepository repository;
        private readonly IRoomValidator validator;
        private readonly ITokenFactory factory;

        public LoginRoomService(IRoomRepository repository, IRoomValidator validator, ITokenFactory factory)
        {
            this.repository = repository;
            this.validator = validator;
            this.factory = factory;
        }

        public async Task<(ServiceResult, string)> Execute(string name, string password)
        {
            RoomDTO? roomDTO = (RoomDTO?)await repository.GetRoom(name);
            if (roomDTO is null)
            {
                log.Warn($"Room with name {name.ToLower()} dosen't exist");
                return new(ServiceResult.ROOM_NOT_FOUND, "");
            }
            Room room = Mapper<RoomDTO, Room>.Map(roomDTO);

            if (!validator.VerifyPassword(room, password))
            {
                log.Warn($"Incorrect password for room {room.Name}");
                return new(ServiceResult.WRONG_PASSWORD, "");
            }

            var token = factory.Create(room);
            log.Info($"Token was succesfuly created for room {room.Name}");
            return new(ServiceResult.OK, token);
        }

    }
}

