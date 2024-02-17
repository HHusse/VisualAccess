using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.DataAccess.Models
{
    public class RequestRoomPermissionDTO
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; } = new("");

        [BsonElement("type")]
        [BsonRequired]
        [BsonRepresentation(BsonType.String)]
        public RequestRoomPermissionType Type { get; set; }

        [BsonElement("username")]
        [BsonRequired]
        public string Username { get; set; } = new("");

        [BsonElement("roomName")]
        [BsonRequired]
        public string RoomName { get; set; } = new("");

        [BsonElement("requestMessage")]
        [BsonRequired]
        public string? RequestMessage { get; set; }
    }
}

