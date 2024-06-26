﻿using System;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.Repositories
{
    public interface IRequestRoomPermissionRepository
    {
        public Task<DatabaseResult> CreateRequest(RequestRoomPermission requestRoomPermission);
        public Task<DatabaseResult> DeleteRequest(RequestRoomPermission requestRoomPermission);
        public Task<IDtoBase?> GetById(string requestId);
        public Task<IEnumerable<IDtoBase>> GetByPage(int pageNumber, int pageSize = 5);
        public Task<bool> RequestExists(string username, string roomName);
        public Task<long> GetRequestsCount();
    }
}

