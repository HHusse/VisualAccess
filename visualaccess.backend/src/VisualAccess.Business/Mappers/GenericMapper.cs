﻿using System;
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
                cfg.CreateMap<Room, RoomDTO>();
                cfg.CreateMap<RoomDTO, Room>();
                cfg.CreateMap<Account, AccountDTO>();
                cfg.CreateMap<AccountDTO, Account>();
                cfg.CreateMap<EntranceRecord, EntranceRecordDTO>();
                cfg.CreateMap<EntranceRecordDTO, EntranceRecord>();
                cfg.CreateMap<Notification, NotificationDTO>();
                cfg.CreateMap<NotificationDTO, Notification>();
                cfg.CreateMap<RequestRoomPermission, RequestRoomPermissionDTO>();
                cfg.CreateMap<RequestRoomPermissionDTO, RequestRoomPermission>();
                cfg.CreateMap<TemporaryRoomPermission, TemporaryRoomPermissionDTO>();
                cfg.CreateMap<TemporaryRoomPermissionDTO, TemporaryRoomPermission>();
            });

            mapper = config.CreateMapper();
        }

        public TDestination Map<TSource, TDestination>(TSource source)
        {
            return mapper.Map<TSource, TDestination>(source);
        }
    }
}

