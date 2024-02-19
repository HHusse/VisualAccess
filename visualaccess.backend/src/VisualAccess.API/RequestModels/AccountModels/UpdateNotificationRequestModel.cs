using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API;

public class UpdateNotificationRequestModel
{
    [Required]
    public string? Id { get; set; }

    [Required]
    public bool IsRead { get; set; }
}
