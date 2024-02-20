using System;
using System.Security.Principal;
using log4net;
using MongoDB.Driver;
using VisualAccess.DataAccess.Contexts;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Exceptions;
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

        public async Task<IEnumerable<DTOBase>> GetEntranceRecordsByPage(int pageNumber, int pageSize = 5)
        {
            try
            {
                int skip = (pageNumber - 1) * pageSize;

                var filter = Builders<EntranceRecordDTO>.Filter.Empty;
                var entranceRecords = await dbContext.EntranceRecordsCollection
                    .Find(filter)
                    .SortByDescending(record => record.Time)
                    .Skip(skip)
                    .Limit(pageSize)
                    .ToListAsync();

                log.Info($"Found {entranceRecords.Count()} entrance records on page {pageNumber}");
                return entranceRecords;
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                throw;
            }
        }
    }
}

