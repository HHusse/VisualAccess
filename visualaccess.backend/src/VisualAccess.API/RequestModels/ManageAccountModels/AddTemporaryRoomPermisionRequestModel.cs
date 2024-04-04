using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.ManageAccountModels;

public class AddTemporaryRoomPermisionRequestModel
{
    [Required]
    public string? Username { get; set; }
    [Required]
    public string? RoomName { get; set; }

    [Required]
    public int Days { get; set; }
}
