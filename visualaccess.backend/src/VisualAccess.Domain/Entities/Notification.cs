using System;
namespace VisualAccess.Domain.Entities
{
    public class Notification
    {
        public string? Id { get; set; }
        public string From { get; set; } = new("");
        public string MessageText { get; set; } = new("");
        public bool IsRead { get; set; }
    }
}

