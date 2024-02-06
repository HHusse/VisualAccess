using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.DataAccess.Models
{
    public class AccountDTO : DTOBase
    {

        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }

        [BsonElement("firstName")]
        [BsonRequired]
        public string? FirstName { get; set; }

        [BsonElement("lastName")]
        [BsonRequired]
        public string? LastName { get; set; }

        [BsonElement("username")]
        [BsonRequired]
        public string? Username { get; set; }

        [BsonElement("email")]
        [BsonRequired]
        public string? Email { get; set; }

        [BsonElement("password")]
        [BsonRequired]
        public string? Password { get; set; }

        [BsonElement("address")]
        [BsonRequired]
        public string? Address { get; set; }

        [BsonElement("phoneNumber")]
        [BsonRequired]
        public string? PhoneNumber { get; set; }

        [BsonElement("role")]
        [BsonRequired]
        [BsonRepresentation(BsonType.String)]
        public Role Role { get; set; }

        [BsonElement("faceId")]
        public int? FaceID { get; set; }

        [BsonElement("allowedRooms")]
        public List<string> AllowedRooms { get; set; } = new();

        [BsonElement("createdAt")]
        [BsonRequired]
        public long CreatedAt { get; set; }
    }
}

