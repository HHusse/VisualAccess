using System;
using System.ComponentModel.DataAnnotations;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.API.RequestModels.RequestRoomPermissionModels
{
    public class ValidRequestRoomPermissionAttribute : ValidationAttribute
    {
        protected override ValidationResult? IsValid(object? value, ValidationContext validationContext)
        {
            if (value is string stringValue && Enum.TryParse<RequestRoomPermissionType>(stringValue, out _))
            {
                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult("Invalid type value.");
            }
        }
    }
}

