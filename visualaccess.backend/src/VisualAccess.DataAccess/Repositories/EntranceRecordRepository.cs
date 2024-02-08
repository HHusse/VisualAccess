using System;
using System.Security.Principal;
using log4net;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.DataAccess.Repositories
{
    public class EntranceRecordRepository : IEntranceRecordRepository
    {
        private readonly ILog log = LogManager.GetLogger("Database");
        private readonly VisualAccessDbContextMongoDB dbContext;
        private readonly IGenericMapper mapper;

        public EntranceRecordRepository(VisualAccessDbContextMongoDB dbContext, IGenericMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public async Task<DatabaseResult> CreateEntranceRecord(EntranceRecord entranceRecord)
        {
            EntranceRecordDTO newEntranceRecord = mapper.Map<EntranceRecord, EntranceRecordDTO>(entranceRecord);
            await dbContext.EntranceRecordsCollection.InsertOneAsync(newEntranceRecord);
            log.Info($"Entrance record created successfully.");
            return DatabaseResult.OK;
        }
    }
}

