using System;
namespace VisualAccess.Domain.Interfaces.Mappers
{
    public interface IGenericMapper
    {
        public TDestination Map<TSource, TDestination>(TSource source);
    }
}

