using System;
using AutoMapper;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Mappers;

namespace VisualAccess.Business.Mappers
{
    public class GenericMapper : IGenericMapper
    {
        private readonly IMapper mapper;

        public GenericMapper()
        {
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Room, RoomDto>();
                cfg.CreateMap<RoomDto, Room>();
                cfg.CreateMap<Account, AccountDto>();
                cfg.CreateMap<AccountDto, Account>();
                cfg.CreateMap<EntranceRecord, EntranceRecordDto>();
                cfg.CreateMap<EntranceRecordDto, EntranceRecord>();
                cfg.CreateMap<Notification, NotificationDto>();
                cfg.CreateMap<NotificationDto, Notification>();
                cfg.CreateMap<RequestRoomPermission, RequestRoomPermissionDto>();
                cfg.CreateMap<RequestRoomPermissionDto, RequestRoomPermission>();
                cfg.CreateMap<TemporaryRoomPermission, TemporaryRoomPermissionDto>();
                cfg.CreateMap<TemporaryRoomPermissionDto, TemporaryRoomPermission>();
                cfg.CreateMap<RequestDecisions, RequestDecisionsDto>();
                cfg.CreateMap<RequestDecisionsDto, RequestDecisions>();
            });

            mapper = config.CreateMapper();
        }

        public TDestination Map<TSource, TDestination>(TSource source)
        {
            return mapper.Map<TSource, TDestination>(source);
        }
    }
}

