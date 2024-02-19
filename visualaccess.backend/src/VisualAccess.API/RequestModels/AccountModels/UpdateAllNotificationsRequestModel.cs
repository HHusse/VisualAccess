using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API;

public class UpdateAllNotificationsRequestModel
{
    [Required]
    public bool IsRead { get; set; }
}
