using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Factories;

namespace VisualAccess.Business.Factories;

public class NotificationFactory : INotificationFactory
{
    public Notification Create(string from, string messageText)
    {
        return new Notification
        {
            Id = Guid.NewGuid().ToString(),
            From = from,
            MessageText = messageText,
            IsRead = false
        };
    }
}
