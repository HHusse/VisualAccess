using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.DataAccess.Models
{
    public class RequestDecisionsDto : IDtoBase
    {
        [BsonElement("id")]
        [BsonRequired]
        public string? Id { get; set; }
        [BsonElement("approver")]
        [BsonRequired]
        public string? Approver { get; set; }
        [BsonElement("username")]
        [BsonRequired]
        public string? Username { get; set; }
        [BsonElement("room")]
        [BsonRequired]
        public string? Room { get; set; }
        [BsonElement("type")]
        [BsonRequired]
        [BsonRepresentation(BsonType.String)]
        public RequestRoomPermissionType? Type { get; set; }
        [BsonElement("isApproved")]
        [BsonRequired]
        public bool IsApproved { get; set; }
    }
}
