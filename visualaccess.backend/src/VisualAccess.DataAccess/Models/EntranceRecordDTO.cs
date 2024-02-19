using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace VisualAccess.DataAccess.Models
{
    public class EntranceRecordDTO
    {
        [BsonElement("id")]
        [BsonRequired]
        public string? Id { get; set; }

        [BsonElement("username")]
        [BsonRequired]
        public string? Username { get; set; }

        [BsonElement("roomName")]
        [BsonRequired]
        public string? RoomName { get; set; }

        [BsonElement("time")]
        [BsonRequired]
        public long Time { get; set; }

        [BsonElement("hasEntered")]
        [BsonRequired]
        public bool hasEntered { get; set; }
    }
}

