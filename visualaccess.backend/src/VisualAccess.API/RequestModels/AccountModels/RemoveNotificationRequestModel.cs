using System.ComponentModel.DataAnnotations;

namespace VisualAccess.API.RequestModels.AccountModels;

public class RemoveNotificationRequestModel
{
    [Required]
    public string? Id { get; set; }
}
