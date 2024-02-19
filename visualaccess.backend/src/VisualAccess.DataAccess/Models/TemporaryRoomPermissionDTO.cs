using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Models
{
    public class TemporaryRoomPermissionDTO : DTOBase
    {
        [BsonElement("room")]
        [BsonRequired]
        public string Room { get; set; } = new("");

        [BsonElement("from")]
        [BsonRequired]
        public long From { get; set; }

        [BsonElement("until")]
        [BsonRequired]
        public long Until { get; set; }
    }
}

