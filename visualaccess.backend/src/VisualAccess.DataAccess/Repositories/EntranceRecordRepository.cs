using System;
using System.Security.Principal;
using log4net;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Contexts;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.DataAccess.Repositories
{
    public class EntranceRecordRepository : IEntranceRecordRepository
    {
        private readonly VisualAccessDbContextMongoDB dbContext;
        private readonly ILog log = LogManager.GetLogger("Database");

        public EntranceRecordRepository(IVisualAccessDbContextMongoDB dbContext)
        {
            this.dbContext = (VisualAccessDbContextMongoDB)dbContext;
        }

        public async Task<DatabaseResult> CreateEntranceRecord(EntranceRecord entranceRecord)
        {
            EntranceRecordDTO newEntranceRecord = Mapper<EntranceRecord, EntranceRecordDTO>.Map(entranceRecord);
            await dbContext.EntranceRecordsCollection.InsertOneAsync(newEntranceRecord);
            log.Info($"Entrance record created successfully.");
            return DatabaseResult.OK;
        }
    }
}

