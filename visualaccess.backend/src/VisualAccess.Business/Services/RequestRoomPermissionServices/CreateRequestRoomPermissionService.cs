using System;
using System.Linq;
using log4net;
using VisualAccess.Business.Services.ManageAccountServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.RequestRoomPermissionServices
{
    public class CreateRequestRoomPermissionService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(CreateRequestRoomPermissionService));
        private readonly IAccountRepository accountRepository;
        private readonly IRoomRepository roomRepository;
        private readonly IRequestRoomPermissionRepository requestRoomPermissionRepository;

        public CreateRequestRoomPermissionService(IAccountRepository accountRepository, IRoomRepository roomRepository, IRequestRoomPermissionRepository requestRoomPermissionRepository, IGenericMapper mapper)
        {
            this.accountRepository = accountRepository;
            this.roomRepository = roomRepository;
            this.requestRoomPermissionRepository = requestRoomPermissionRepository;
        }

        public async Task<ServiceResult> Execute(RequestRoomPermission requestRoomPermission, Account account)
        {
            requestRoomPermission.Username = account.Username;

            if (account.AllowedRooms.Contains(requestRoomPermission.RoomName) || account.TemporaryRoomPermissions.Exists(temp => temp.Room == requestRoomPermission.RoomName))
            {
                log.Warn($"Account {account.Username} already have permission in room {requestRoomPermission.RoomName}");
                return ServiceResult.ROOM_PERMISSION_ALREADY_EXIST;
            }

            if (await roomRepository.RoomExist(requestRoomPermission.RoomName) != DatabaseResult.ROOM_EXIST)
            {
                log.Warn($"Room with {requestRoomPermission.RoomName} dosen't exist");
                return ServiceResult.ROOM_NOT_FOUND;
            }

            if (await requestRoomPermissionRepository.RequestExists(account.Username, requestRoomPermission.RoomName))
            {
                log.Warn($"Request room permission for account {account.Username} in room {requestRoomPermission.RoomName} already exist");
                return ServiceResult.REQUEST_ALREADY_EXIST;
            }

            var response = await requestRoomPermissionRepository.CreateRequest(requestRoomPermission);

            if (response != DatabaseResult.OK)
            {
                return ServiceResult.DATABASE_ERROR;
            }

            log.Info($"Request room permission succesfuly created");
            return ServiceResult.OK;
        }
    }
}

