using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Models
{
    public class RoomDTO : DTOBase
    {

        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }

        [BsonElement("name")]
        [BsonRequired]
        public string? Name { get; set; }

        [BsonElement("password")]
        [BsonRequired]
        public string? Password { get; set; }

        [BsonElement("createdAt")]
        [BsonRequired]
        public long CreatedAt { get; set; }
    }
}

