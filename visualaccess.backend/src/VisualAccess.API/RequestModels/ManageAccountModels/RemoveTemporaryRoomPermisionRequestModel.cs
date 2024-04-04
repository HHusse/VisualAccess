using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.ManageAccountModels;

public class RemoveTemporaryRoomPermisionRequestModel
{
    [Required]
    public string? Username { get; set; }
    [Required]
    public string? RoomName { get; set; }
}
