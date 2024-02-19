using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;

namespace VisualAccess.FaceRecognition.Services
{
    public class VerifyFaceService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterFaceService));
        private Room room;
        private readonly IAccountRepository accountRepository;
        private readonly IFaceRecognitionServiceClient client;
        private readonly IRoomRepository roomRepository;
        private readonly IEntranceRecordRepository entranceRecordRepository;
        private readonly IGenericMapper mapper;

        public VerifyFaceService(Room room, IAccountRepository accountRepository, IFaceRecognitionServiceClient client, IRoomRepository roomRepository, IEntranceRecordRepository entranceRecordRepository, IGenericMapper mapper)
        {
            this.accountRepository = accountRepository;
            this.client = client;
            this.roomRepository = roomRepository;
            this.entranceRecordRepository = entranceRecordRepository;
            this.mapper = mapper;
            this.room = room;
        }

        public async Task<ServiceResult> Execute(MemoryStream faceStream)
        {
            var faceRecognitionResult = await client.VerifyFaceAsync(faceStream);
            if (faceRecognitionResult.Item1 == FaceRecognitionResult.OK)
            {
                AccountDTO? accountDTO = (AccountDTO?)await accountRepository.GetAccount((int)faceRecognitionResult.Item2!);
                if (accountDTO is null)
                {
                    log.Warn($"No account found for user {faceRecognitionResult.Item2}");
                    return ServiceResult.ACCOUNT_NOT_FOUND;
                }

                Account account = mapper.Map<AccountDTO, Account>(accountDTO);
                account.TemporaryRoomPermissions.RemoveAll(temp => temp.Until < DateTimeOffset.Now.ToUnixTimeSeconds());
                _ = accountRepository.UpdateAccount(account);
                if (!account.AllowedRooms.Contains(room.Name) && !account.TemporaryRoomPermissions.Exists(temp => temp.Room == room.Name && temp.Until > DateTimeOffset.Now.ToUnixTimeSeconds()))
                {
                    EntranceRecord notAllowedRecord = new(Guid.NewGuid().ToString(), account.Username, room.Name, DateTimeOffset.Now.ToUnixTimeSeconds(), false);
                    log.Info($"Account {notAllowedRecord.username} tried to enter in room {notAllowedRecord.roomName} at time {notAllowedRecord.time} but has no permission");
                    _ = entranceRecordRepository.CreateEntranceRecord(notAllowedRecord);
                    return ServiceResult.ACCOUNT_HAS_NO_PERMISSION;
                }
                EntranceRecord record = new(Guid.NewGuid().ToString(), account.Username, room.Name, DateTimeOffset.Now.ToUnixTimeSeconds(), true);
                log.Info($"Account {record.username} tried to enter in room {record.roomName} at time {record.time} and passed");
                _ = entranceRecordRepository.CreateEntranceRecord(record);
                return ServiceResult.OK;
            }

            if (faceRecognitionResult.Item1 == FaceRecognitionResult.NOT_FOUND)
            {
                return ServiceResult.FACE_NOT_FOUND;
            }

            if (faceRecognitionResult.Item1 == FaceRecognitionResult.NOT_REGISTERD)
            {
                return ServiceResult.FACE_NOT_REGISTERD;
            }

            return ServiceResult.UNKNOWN_ERROR;
        }

    }
}

