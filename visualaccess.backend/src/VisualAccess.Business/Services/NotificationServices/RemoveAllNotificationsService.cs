using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.NotificationServices;

public class RemoveAllNotificationsService
{
    private readonly ILog log = LogManager.GetLogger(typeof(RemoveAllNotificationsService));

    private Account account;
    private readonly IAccountRepository accountRepository;

    public RemoveAllNotificationsService(Account account, IAccountRepository accountRepository)
    {
        this.account = account;
        this.accountRepository = accountRepository;
    }

    public async Task<ServiceResult> Execute()
    {
        account.Notifications.Clear();
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
