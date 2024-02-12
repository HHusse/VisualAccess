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
                    log.Info("Request is made by an Account");
                    var usernameClaim = context.User.FindFirst(ClaimTypes.NameIdentifier);
                    if (usernameClaim is not null)
                    {
                        GetAccountervice getAccountService = new(accountRepository, mapper);
                        var serviceResponse = await getAccountService.Execute(usernameClaim.Value);
                        var account = serviceResponse.Item2;
                        if (account is not null)
                        {
                            context.SetAccount(account);
                        }
                        else
                        {
                            log.Error($"Account with username {usernameClaim.Value} couldn't be found");
                        }
                    }
                    else
                    {
                        log.Error($"Could not found the usernameClaim");
                    }

                }
                else if (isRoomClaim is not null)
                {
                    log.Info("Request is made by a Room");
                    var roomNameClaim = context.User.FindFirst(ClaimTypes.NameIdentifier);
                    if (roomNameClaim is not null)
                    {
                        GetRoomService getRoomService = new(roomRepository, mapper);
                        var serviceResponse = await getRoomService.Execute(roomNameClaim.Value);
                        var room = serviceResponse.Item2;
                        if (room is not null)
                        {
                            context.SetRoom(room);
                        }
                        else
                        {
                            log.Error($"Room with name {roomNameClaim.Value} couldn't be found");
                        }
                    }
                    else
                    {
                        log.Error($"Could not found the roomNameClaim");
                    }
                }

            }
            await next(context);
        }
    }
}


