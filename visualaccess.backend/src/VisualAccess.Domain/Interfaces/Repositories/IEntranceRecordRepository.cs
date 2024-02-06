using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IEntranceRecordRepository
    {
        public Task<DatabaseResult> CreateEntranceRecord(EntranceRecord entranceRecord);
    }
}

