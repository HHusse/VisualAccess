using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.Factories;

public interface INotificationFactory
{
    public Notification Create(string from, string messageText);
}
