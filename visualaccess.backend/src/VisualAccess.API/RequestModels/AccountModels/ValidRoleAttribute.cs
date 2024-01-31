using System;
using System.ComponentModel.DataAnnotations;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.API.RequestModels.AccountModels
{
    public class ValidRoleAttribute : ValidationAttribute
    {
        protected override ValidationResult? IsValid(object? value, ValidationContext validationContext)
        {
            if (value is string stringValue && Enum.TryParse<Role>(stringValue, out _))
            {
                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult("Invalid role value.");
            }
        }
    }
}

