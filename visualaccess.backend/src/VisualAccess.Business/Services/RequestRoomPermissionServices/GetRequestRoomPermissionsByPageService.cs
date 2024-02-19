using System;
using AutoMapper;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.RequestRoomPermissionServices
{
    public class GetRequestRoomPermissionsByPageService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(GetRequestRoomPermissionsByPageService));
        private readonly IRequestRoomPermissionRepository requestRoomPermissionRepository;
        private readonly IGenericMapper mapper;

        public GetRequestRoomPermissionsByPageService(IRequestRoomPermissionRepository requestRoomPermissionRepository, IGenericMapper mapper)
        {
            this.requestRoomPermissionRepository = requestRoomPermissionRepository;
            this.mapper = mapper;
        }

        public async Task<(ServiceResult, List<RequestRoomPermission>?)> Execute(int page)
        {
            List<RequestRoomPermissionDTO> requests = (List<RequestRoomPermissionDTO>)await requestRoomPermissionRepository.GetByPage(page);
            if (requests.Count() == 0)
            {
                log.Warn($"No accounts found for page {page}");
                return new(ServiceResult.NOT_FOUND, null);
            }

            log.Info($"Fetched {requests.Count()} accounts");
            List<RequestRoomPermission> requestsList = mapper.Map<List<RequestRoomPermissionDTO>, List<RequestRoomPermission>>(requests);
            return new(ServiceResult.OK, requestsList);
        }
    }
}

