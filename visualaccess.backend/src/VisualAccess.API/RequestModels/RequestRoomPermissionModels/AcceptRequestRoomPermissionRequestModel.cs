using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.RequestRoomPermissionModels;

public class AcceptRequestRoomPermissionRequestModel
{
    [Required]
    public string? RequestId { get; set; }
    public int Days { get; set; }
}
