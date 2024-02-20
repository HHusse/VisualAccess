using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.EntranceRecordServices
{
    public class GetEntranceRecordByPageService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(GetEntranceRecordByPageService));
        private readonly IEntranceRecordRepository entranceRecordRepository;
        private readonly IGenericMapper mapper;

        public GetEntranceRecordByPageService(IEntranceRecordRepository entranceRecordRepository, IGenericMapper mapper)
        {
            this.entranceRecordRepository = entranceRecordRepository;
            this.mapper = mapper;
        }

        public async Task<(ServiceResult, List<EntranceRecord>?)> Execute(int page)
        {
            List<EntranceRecordDTO> entranceRecordsDTOList = (List<EntranceRecordDTO>)await entranceRecordRepository.GetEntranceRecordsByPage(page);
            if (entranceRecordsDTOList.Count == 0)
            {
                log.Warn($"No entrance records found for page {page}");
                return new(ServiceResult.NOT_FOUND, null);
            }

            log.Info($"Fetched {entranceRecordsDTOList.Count} entrance records");
            List<EntranceRecord> entranceRecordsList = mapper.Map<List<EntranceRecordDTO>, List<EntranceRecord>>(entranceRecordsDTOList);
            return new(ServiceResult.OK, entranceRecordsList);
        }
    }
}