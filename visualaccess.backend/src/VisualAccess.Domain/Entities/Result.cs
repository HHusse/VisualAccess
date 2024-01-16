using System;
namespace VisualAccess.Domain.Entities
{
    public class Result
    {
        public bool Succed { get; private set; }
        public string Message { get; private set; }

        public Result(bool succed)
        {
            Succed = succed;
            Message = "";
        }

        public Result(bool succed, string message)
        {
            Succed = succed;
            Message = message;
        }
    }
}

