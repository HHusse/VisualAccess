using System;
namespace VisualAccess.DataAccess.Models
{
    public class FacesDTO
    {
        public FacesDTO(int id, string encoding)
        {
            Id = id;
            Encoding = encoding;
        }

        public int Id { get; set; }
        public string Encoding { get; set; }
    }
}

