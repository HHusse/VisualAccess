using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.RequestRoomPermissionModels;

public class DeniedRequestRoomPermissionModel
{
    [Required]
    public string? RequestId { get; set; }
}
