using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Factories;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using ZstdSharp.Unsafe;

namespace VisualAccess.Business.Services.RequestRoomPermissionServices;

public class RemoveRequestRoomPermissionService
{
    private readonly ILog log = LogManager.GetLogger(typeof(RemoveRequestRoomPermissionService));
    private readonly IAccountRepository accountRepository;
    private readonly IRequestRoomPermissionRepository requestRoomPermissionRepository;
    private readonly INotificationFactory notificationFactory;
    private readonly IRequestDecisionsRepository requestDecisionsRepository;
    private readonly IGenericMapper mapper;

    public RemoveRequestRoomPermissionService(IAccountRepository accountRepository, IRequestRoomPermissionRepository requestRoomPermissionRepository, INotificationFactory notificationFactory, IRequestDecisionsRepository requestDecisionsRepository, IGenericMapper mapper)
    {
        this.accountRepository = accountRepository;
        this.requestRoomPermissionRepository = requestRoomPermissionRepository;
        this.notificationFactory = notificationFactory;
        this.requestDecisionsRepository = requestDecisionsRepository;
        this.mapper = mapper;
    }

    public async Task<ServiceResult> Execute(Account approverAccount, string requestID)
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
        Notification notification = notificationFactory.Create(approverAccount.Username, $"Your request room permission in room {request.RoomName} was denied");
        account.Notifications.Add(notification);
        if (await accountRepository.UpdateAccount(account) != DatabaseResult.OK)
        {
            return ServiceResult.DATABASE_ERROR;
        }

        DatabaseResult result = await requestRoomPermissionRepository.DeleteRequest(request);
        if (result == DatabaseResult.UNKNOWN_ERROR)
        {
            return ServiceResult.DATABASE_ERROR;
        }
        RequestDecisions requestDecisions = new RequestDecisions(Guid.NewGuid().ToString(), approverAccount.Username, request.Username, request.RoomName, request.Type, false);
        _ = await requestDecisionsRepository.AddRequestDecision(requestDecisions);
        return ServiceResult.OK;
    }
}
