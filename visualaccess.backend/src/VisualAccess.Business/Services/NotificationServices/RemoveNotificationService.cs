using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.NotificationServices;

public class RemoveNotificationService
{
    private readonly ILog log = LogManager.GetLogger(typeof(RemoveNotificationService));

    private readonly Account account;
    private readonly IAccountRepository accountRepository;

    public RemoveNotificationService(Account account, IAccountRepository accountRepository)
    {
        this.account = account;
        this.accountRepository = accountRepository;
    }

    public async Task<ServiceResult> Execute(string id)
    {
        log.Info($"Trying to remove notification {id} for account {account.Username}");
        if (!account.Notifications.Exists(n => n.Id == id))
        {
            return ServiceResult.NOT_FOUND;
        }
        account.Notifications.RemoveAll(n => n.Id == id);
        DatabaseResult result = await accountRepository.UpdateAccount(account);
        switch (result)
        {
            case DatabaseResult.ACCOUNT_NOT_FOUND:
                return ServiceResult.ACCOUNT_NOT_FOUND;
            case DatabaseResult.UNKNOWN_ERROR:
                return ServiceResult.DATABASE_ERROR;
            default:
                return ServiceResult.OK;
        }
    }
}
