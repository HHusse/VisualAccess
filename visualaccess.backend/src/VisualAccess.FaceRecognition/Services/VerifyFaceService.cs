using System;
using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;
using VisualAccess.Domain.Mappers;

namespace VisualAccess.FaceRecognition.Services
{
    public class VerifyFaceService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterFaceService));
        private readonly IAccountRepository accountRepository;
        private readonly IFaceRecognitionServiceClient client;
        private readonly IRoomRepository roomRepository;
        private readonly IEntranceRecordRepository entranceRecordRepository;

        public VerifyFaceService(IAccountRepository accountRepository, IFaceRecognitionServiceClient client, IRoomRepository roomRepository, IEntranceRecordRepository entranceRecordRepository)
        {
            this.accountRepository = accountRepository;
            this.client = client;
            this.roomRepository = roomRepository;
            this.entranceRecordRepository = entranceRecordRepository;
        }

        public async Task<ServiceResult> Execute(MemoryStream faceStream, string roomName)
        {
            RoomDTO? roomDTO = (RoomDTO?)await roomRepository.GetRoom(roomName);
            if (roomDTO is null)
            {
                log.Warn($"Room with name {roomName.ToLower()} dosen't exist");
                return ServiceResult.ROOM_NOT_FOUND;
            }
            Room room = Mapper<RoomDTO, Room>.Map(roomDTO);


            var faceRecognitionResult = await client.VerifyFaceAsync(faceStream);
            if (faceRecognitionResult.Item1 == FaceRecognitionResult.OK)
            {
                AccountDTO? accountDTO = (AccountDTO?)await accountRepository.GetAccount((int)faceRecognitionResult.Item2!);
                if (accountDTO is null)
                {
                    log.Warn($"No account found for user {faceRecognitionResult.Item2}");
                    return ServiceResult.ACCOUNT_NOT_FOUND;
                }

                Account account = Mapper<AccountDTO, Account>.Map(accountDTO);
                if (!account.AllowedRooms.Contains(room.Name))
                {
                    EntranceRecord notAllowedRecord = new(account.Username, room.Name, DateTimeOffset.Now.ToUnixTimeSeconds(), false);
                    log.Info($"Account {notAllowedRecord.username} tried to enter in room {notAllowedRecord.roomName} at time {notAllowedRecord.time} but has no permission");
                    _ = entranceRecordRepository.CreateEntranceRecord(notAllowedRecord);
                    return ServiceResult.ACCOUNT_HAS_NO_PERMISSION;
                }
                EntranceRecord record = new(account.Username, room.Name, DateTimeOffset.Now.ToUnixTimeSeconds(), true);
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

