using System;
using System.Xml.Linq;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.Validators;

namespace VisualAccess.Business.Services.ManageAccountServices
{
    public class AddRoomPremissionService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(AddRoomPremissionService));
        private readonly IAccountRepository accountRepository;
        private readonly IRoomRepository roomRepository;
        private readonly IGenericMapper mapper;

        public AddRoomPremissionService(IAccountRepository accountRepository, IRoomRepository roomRepository, IGenericMapper mapper)
        {
            this.accountRepository = accountRepository;
            this.roomRepository = roomRepository;
            this.mapper = mapper;
        }

        public async Task<ServiceResult> Execute(string username, string roomName)
        {
            AccountDto? accountDTO = (AccountDto?)await accountRepository.GetAccount(username);
            if (accountDTO is null)
            {
                log.Warn($"Account with username {username.ToLower()} dosen't exist");
                return ServiceResult.ACCOUNT_NOT_FOUND;
            }

            RoomDto? roomDTO = (RoomDto?)await roomRepository.GetRoom(roomName);
            if (roomDTO is null)
            {
                log.Warn($"Room with name {roomName.ToLower()} dosen't exist");
                return ServiceResult.ROOM_NOT_FOUND;
            }

            Account account = mapper.Map<AccountDto, Account>(accountDTO);
            Room room = mapper.Map<RoomDto, Room>(roomDTO);
            if (account.AllowedRooms.Exists(r => r == room.Name) || account.TemporaryRoomPermissions.Exists(tr => tr.Room == room.Name))
            {
                log.Warn($"Account {account.Username} has already room permision in room {room.Name}");
                return ServiceResult.ROOM_PERMISSION_ALREADY_EXIST;
            }

            account.AllowedRooms.Add(room.Name);
            DatabaseResult result = await accountRepository.UpdateAccount(account);

            if (result != DatabaseResult.OK)
            {
                switch (result)
                {
                    case DatabaseResult.UNKNOWN_ERROR:
                        return ServiceResult.DATABASE_ERROR;
                    case DatabaseResult.ROOM_PERMISSION_ALREADY_EXIST:
                        return ServiceResult.INVALID_OPERATION;
                }
            }

            return ServiceResult.OK;
        }
    }
}

