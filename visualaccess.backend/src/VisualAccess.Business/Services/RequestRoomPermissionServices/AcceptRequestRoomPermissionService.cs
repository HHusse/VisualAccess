using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.RequestRoomPermissionServices;

public class AcceptRequestRoomPermissionService
{
    private readonly ILog log = LogManager.GetLogger(typeof(AcceptRequestRoomPermissionService));
    private readonly IAccountRepository accountRepository;
    private readonly IRequestRoomPermissionRepository requestRoomPermissionRepository;
    private readonly ITemporaryRoomPermissionFactory temporaryRoomPermissionFactory;
    private readonly INotificationFactory notificationFactory;
    private readonly IRequestDecisionsRepository requestDecisionsRepository;
    private readonly IGenericMapper mapper;

    public AcceptRequestRoomPermissionService(IAccountRepository accountRepository, IRequestRoomPermissionRepository requestRoomPermissionRepository, ITemporaryRoomPermissionFactory temporaryRoomPermissionFactory, INotificationFactory notificationFactory, IRequestDecisionsRepository requestDecisionsRepository, IGenericMapper mapper)
    {
        this.accountRepository = accountRepository;
        this.requestRoomPermissionRepository = requestRoomPermissionRepository;
        this.temporaryRoomPermissionFactory = temporaryRoomPermissionFactory;
        this.notificationFactory = notificationFactory;
        this.requestDecisionsRepository = requestDecisionsRepository;
        this.mapper = mapper;
    }

    public async Task<ServiceResult> Execute(Account approverAccount, string requestID, int days)
    {
        RequestRoomPermissionDto? requestDTO = (RequestRoomPermissionDto?)await requestRoomPermissionRepository.GetById(requestID);
        if (requestDTO is null)
        {
            log.Warn($"Request with id {requestID} dosen't exist");
            return ServiceResult.REQUEST_NOT_FOUND;
        }

        log.Info($"Request with id {requestID} succesfuly found");
        RequestRoomPermission request = mapper.Map<RequestRoomPermissionDto, RequestRoomPermission>(requestDTO);

        AccountDto? accountDTO = (AccountDto?)await accountRepository.GetAccount(request.Username);
        if (accountDTO is null)
        {
            log.Warn($"Account with username {request.Username} dosen't exist");
            _ = requestRoomPermissionRepository.DeleteRequest(request);
            return ServiceResult.ACCOUNT_NOT_FOUND;
        }

        Account account = mapper.Map<AccountDto, Account>(accountDTO);
        if (request.Type == RequestRoomPermissionType.PERMANENT)
        {
            Notification notification = notificationFactory.Create(approverAccount.Username, $"You have received access to room {request.RoomName} permanently");
            account.AllowedRooms.Add(request.RoomName);
            account.Notifications.Add(notification);
            if (await accountRepository.UpdateAccount(account) != DatabaseResult.OK)
            {
                return ServiceResult.DATABASE_ERROR;
            }

            log.Info($"Permission added succesfuly for account {account.Username} in room {request.RoomName}");
            RequestDecisions requestDecisions = new RequestDecisions(Guid.NewGuid().ToString(), approverAccount.Username, request.Username, request.RoomName, request.Type, true, DateTimeOffset.Now.ToUnixTimeSeconds());
            _ = requestDecisionsRepository.AddRequestDecision(requestDecisions);
            _ = requestRoomPermissionRepository.DeleteRequest(request);
            return ServiceResult.OK;
        }

        else if (request.Type == RequestRoomPermissionType.TEMPORARY)
        {
            if (days < 1)
            {
                log.Warn($"Temporary permission cannot be added for {days} days");
                return ServiceResult.INVALID_OPERATION;
            }
            Notification notification = notificationFactory.Create(approverAccount.Username, $"You received access to room {request.RoomName} temporarily for {days} days");
            TemporaryRoomPermission permission = temporaryRoomPermissionFactory.Create(request.RoomName, DateTimeOffset.Now.ToUnixTimeSeconds(), DateTimeOffset.Now.AddDays(days).ToUnixTimeSeconds());
            account.TemporaryRoomPermissions.Add(permission);
            account.Notifications.Add(notification);
            if (await accountRepository.UpdateAccount(account) != DatabaseResult.OK)
            {
                return ServiceResult.DATABASE_ERROR;
            }

            log.Info($"Temporary permission added succesfuly for account {account.Username} in room {request.RoomName} for {days} days");
            RequestDecisions requestDecisions = new RequestDecisions(Guid.NewGuid().ToString(), approverAccount.Username, request.Username, request.RoomName, request.Type, true, DateTimeOffset.Now.ToUnixTimeSeconds());
            _ = requestDecisionsRepository.AddRequestDecision(requestDecisions);
            _ = requestRoomPermissionRepository.DeleteRequest(request);
            return ServiceResult.OK;
        }
        return ServiceResult.UNKNOWN_ERROR;
    }
}
