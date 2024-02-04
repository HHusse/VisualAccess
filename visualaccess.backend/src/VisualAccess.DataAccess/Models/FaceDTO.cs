using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.DataAccess.Models
{
    public class FaceDTO : DTOBase
    {
        public FaceDTO(int id, string encoding)
        {
            Id = id;
            Encoding = encoding;
        }

        public int Id { get; set; }
        public string Encoding { get; set; }
        public virtual AccountDTO? Account { get; set; }
    }
}

