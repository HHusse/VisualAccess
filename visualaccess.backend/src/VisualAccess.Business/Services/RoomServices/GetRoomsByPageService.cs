using log4net;
using VisualAccess.DataAccess.Models;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Enumerations;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.Business.Services.RoomServices;

public class GetRoomsByPageService
{
    private readonly ILog log = LogManager.GetLogger(typeof(GetRoomsByPageService));
    private readonly IRoomRepository roomRepository;
    private readonly IGenericMapper mapper;

    public GetRoomsByPageService(IRoomRepository roomRepository, IGenericMapper mapper)
    {
        this.roomRepository = roomRepository;
        this.mapper = mapper;
    }

    public async Task<(ServiceResult, List<Room>?, long)> Execute(int page)
    {
        List<RoomDTO> rooms = (List<RoomDTO>)await roomRepository.GetRoomsByPage(page);
        long roomsCount = await roomRepository.GetRoomsCount();
        double pagesDouble = (double)roomsCount / 5;
        long pages = (long)Math.Ceiling(pagesDouble);

        if (rooms.Count() == 0)
        {
            log.Warn($"No room found for page {page}");
            return new(ServiceResult.NOT_FOUND, null, 0);
        }

        log.Info($"Fetched {rooms.Count()} rooms");
        List<Room> roomsList = mapper.Map<List<RoomDTO>, List<Room>>(rooms);
        return new(ServiceResult.OK, roomsList, pages);
    }
}
