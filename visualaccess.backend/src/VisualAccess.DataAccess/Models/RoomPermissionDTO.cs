using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Models
{
    public class RoomPermissionDTO : DTOBase
    {
        public RoomPermissionDTO(int accountId, int roomId)
        {
            AccountId = accountId;
            RoomId = roomId;
        }

        public int Id { get; set; }

        public int AccountId { get; set; }
        public virtual AccountDTO? Account { get; set; }

        public int RoomId { get; set; }
        public virtual RoomDTO? Room { get; set; }
    }
}

