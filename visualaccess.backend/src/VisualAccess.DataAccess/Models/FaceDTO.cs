using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Models
{
    public class FaceDto : IDtoBase
    {
        public FaceDto(int id, string encoding)
        {
            Id = id;
            Encoding = encoding;
        }

        public int Id { get; set; }
        public string Encoding { get; set; }
    }
}

