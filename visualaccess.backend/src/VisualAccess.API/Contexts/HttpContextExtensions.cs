using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.API.Contexts
{
    public static class HttpContextExtensions
    {
        private static readonly string AccountKey = "CurrentUserAccount";
        private static readonly string RoomKey = "CurrentRoom";

        public static void SetAccount(this HttpContext context, Account account)
        {
            if (context == null) throw new ArgumentNullException(nameof(context));
            context.Items[AccountKey] = account;
        }

        public static Account? GetAccount(this HttpContext context)
        {
            return context.Items.ContainsKey(AccountKey) ? context.Items[AccountKey] as Account : null;
        }

        public static void SetRoom(this HttpContext context, Room room)
        {
            if (context == null) throw new ArgumentNullException(nameof(context));
            context.Items[RoomKey] = room;
        }

        public static Room? GetRoom(this HttpContext context)
        {
            return context.Items.ContainsKey(RoomKey) ? context.Items[RoomKey] as Room : null;
        }
    }
}

