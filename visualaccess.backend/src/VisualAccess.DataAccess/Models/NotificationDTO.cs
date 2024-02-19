using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace VisualAccess.DataAccess.Models
{
    public class NotificationDTO
    {
        [BsonElement("id")]
        [BsonRequired]
        public string Id { get; set; } = new("");

        [BsonElement("from")]
        [BsonRequired]
        public string From { get; set; } = new("");

        [BsonElement("message")]
        [BsonRequired]
        public string MessageText { get; set; } = new("");

        [BsonElement("isRead")]
        [BsonRequired]
        public bool IsRead { get; set; }
    }
}

