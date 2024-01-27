using System;
namespace VisualAccess.Domain.Entities
{
    public class Result
    {
        public bool Succed { get; private set; }
        public uint Code { get; private set; }
        public string Message { get; private set; }

        public Result(bool succed)
        {
            Succed = succed;
            Code = 0;
            Message = "";
        }

        public Result(bool succed, string message)
        {
            Succed = succed;
            Code = 0;
            Message = message;
        }

        public Result(bool succed, uint code, string message)
        {
            Succed = succed;
            Code = code;
            Message = message;
        }
    }
}

