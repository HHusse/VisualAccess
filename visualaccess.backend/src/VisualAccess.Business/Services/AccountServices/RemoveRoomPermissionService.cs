﻿using System;
using System.Xml.Linq;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.Business.Services.AccountServices
{
    public class RemoveRoomPermissionService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RemoveRoomPermissionService));
        private readonly IAccountRepository accountRepository;
        private readonly IRoomRepository roomRepository;
        private readonly IRoomPermissionRepository roomPermissionRepository;

        public RemoveRoomPermissionService(IAccountRepository accountRepository, IRoomRepository roomRepository, IRoomPermissionRepository roomPermissionRepository)
        {
            this.accountRepository = accountRepository;
            this.roomRepository = roomRepository;
            this.roomPermissionRepository = roomPermissionRepository;
        }

        public async Task<ServiceResult> Execute(string username, string roomName)
        {
            AccountDTO? accountDTO = (AccountDTO?)await accountRepository.GetAccountByUsername(username);
            if (accountDTO is null)
            {
                log.Warn($"Account with username {username.ToLower()} dosen't exist");
                return ServiceResult.ACCOUNT_NOT_FOUND;
            }

            RoomDTO? roomDTO = (RoomDTO?)await roomRepository.GetRoom(roomName);
            if (roomDTO is null)
            {
                log.Warn($"Room with name {roomName.ToLower()} dosen't exist");
                return ServiceResult.ROOM_NOT_FOUND;
            }

            Account account = Mapper<AccountDTO, Account>.Map(accountDTO);
            Room room = Mapper<RoomDTO, Room>.Map(roomDTO);

            DatabaseResult result = await roomPermissionRepository.RemoveRoomPermissionToAccount(account, room);

            if (result != DatabaseResult.OK)
            {
                switch (result)
                {
                    case DatabaseResult.UNKNOWN_ERROR:
                        return ServiceResult.DATABASE_ERROR;
                    case DatabaseResult.ROOM_PERMISSION_NOT_FOUND:
                        return ServiceResult.INVALID_OPERATION;
                }
            }

            return ServiceResult.OK;
        }
    }
}

