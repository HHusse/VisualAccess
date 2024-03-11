using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IEntranceRecordRepository
    {
        public Task<DatabaseResult> CreateEntranceRecord(EntranceRecord entranceRecord);
        public Task<IEnumerable<IDtoBase>> GetEntranceRecordsByPage(int pageNumber, int pageSize = 5);
        public Task<long> GetEntranceRecordsCount();
    }
}

