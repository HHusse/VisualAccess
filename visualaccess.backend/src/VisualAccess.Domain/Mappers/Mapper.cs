using System;
using AutoMapper;

namespace VisualAccess.Domain.Mappers
{
    public static class Mapper<TSource, TDestination>
    {
        public static TDestination Map(TSource source)
        {
            var configMapper = new MapperConfiguration(cfg => cfg.CreateMap<TSource, TDestination>());

            var mapper = configMapper.CreateMapper();
            return mapper.Map<TSource, TDestination>(source);
        }
    }
}

