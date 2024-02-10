using System;
using System.Security.Claims;
using log4net;
using VisualAccess.API.Contexts;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Business.Services.RoomServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.API.Middlewares
{
    using GetAccountervice = Business.Services.AccountServices.GetService;
    using GetRoomService = Business.Services.RoomServices.GetService;

    public class ExtractionMiddleware
    {
        private readonly RequestDelegate next;
        private readonly ILog log;

        public ExtractionMiddleware(RequestDelegate next, ILog log)
        {
            this.next = next;
            this.log = log;
        }

        public async Task Invoke(HttpContext context, IAccountRepository accountRepository, IRoomRepository roomRepository, IGenericMapper mapper)
        {
            if (context.User.Identity is null)
            {
                await next(context);
                return;
            }

            if (context.User.Identity.IsAuthenticated)
            {
                var user = context.User;
                var isAccountClaim = user.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Actor && c.Value == "ACCOUNT");
                var isRoomClaim = user.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Actor && c.Value == "ROOM");

                if (isAccountClaim is not null)
                {
                    log.Info($"Account claim found in token");
                    var usernameClaim = context.User.FindFirst(ClaimTypes.NameIdentifier);
                    if (usernameClaim is not null)
                    {
                        log.Info($"Account username claim found in token: {usernameClaim.Value}");
                        GetAccountervice getAccountService = new(accountRepository, mapper);
                        var serviceResponse = await getAccountService.Execute(usernameClaim.Value);
                        var account = serviceResponse.Item2;
                        if (account is not null)
                        {
                            log.Info($"Account with username {usernameClaim.Value} found");
                            context.SetAccount(account);
                        }
                    }

                }
                else if (isRoomClaim is not null)
                {
                    log.Info($"Room claim found in token");
                    var roomName = context.User.FindFirst(ClaimTypes.NameIdentifier);
                    if (roomName is not null)
                    {
                        log.Info($"Room name claim found in token: {roomName.Value}");
                        GetRoomService getRoomService = new(roomRepository, mapper);
                        var serviceResponse = await getRoomService.Execute(roomName.Value);
                        var room = serviceResponse.Item2;
                        if (room is not null)
                        {
                            log.Info($"Room with name {roomName.Value} found in token");
                            context.SetRoom(room);
                        }
                    }
                }

            }

            await next(context);
        }
    }
}

