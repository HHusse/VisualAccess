using System;
using System.Security.Claims;
using log4net;
using Microsoft.EntityFrameworkCore;
using VisualAccess.API.Contexts;
using VisualAccess.Business.Services.AccountServices;
using VisualAccess.Business.Services.RoomServices;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Mappers;
using VisualAccess.Domain.Interfaces.Repositories;

namespace VisualAccess.API.Middlewares
{
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
            if (context.User.Identity is null || !context.User.Identity.IsAuthenticated)
            {
                await next(context);
                return;
            }

            await ProcessClaims(context, accountRepository, roomRepository, mapper);
            await next(context);
        }

        private async Task ProcessClaims(HttpContext context, IAccountRepository accountRepository, IRoomRepository roomRepository, IGenericMapper mapper)
        {
            var user = context.User;
            var claimType = user.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Actor)?.Value;

            switch (claimType)
            {
                case "ACCOUNT":
                    await HandleAccountClaim(user, context, accountRepository, mapper);
                    break;
                case "ROOM":
                    await HandleRoomClaim(user, context, roomRepository, mapper);
                    break;
            }
        }

        private async Task HandleAccountClaim(ClaimsPrincipal user, HttpContext context, IAccountRepository accountRepository, IGenericMapper mapper)
        {
            var usernameClaim = GetClaim(user, ClaimTypes.NameIdentifier);
            if (usernameClaim == null)
            {
                LogError("Could not find the usernameClaim");
                return;
            }

            var serviceResponse = await new GetAccountService(accountRepository, mapper).Execute(usernameClaim);
            if (serviceResponse.Item2 is not null)
            {
                LogInfo($"Authorization info: Account {serviceResponse.Item2.Username}");
                context.SetAccount(serviceResponse.Item2);
            }
            else
            {
                LogError($"Account with username {usernameClaim} couldn't be found");
            }
        }

        private async Task HandleRoomClaim(ClaimsPrincipal user, HttpContext context, IRoomRepository roomRepository, IGenericMapper mapper)
        {
            var roomNameClaim = GetClaim(user, ClaimTypes.NameIdentifier);
            if (roomNameClaim == null)
            {
                LogError("Could not find the roomNameClaim");
                return;
            }

            var serviceResponse = await new GetRoomService(roomRepository, mapper).Execute(roomNameClaim);
            if (serviceResponse.Item2 is not null)
            {
                LogInfo($"Authorization info: Room {serviceResponse.Item2.Name}");
                context.SetRoom(serviceResponse.Item2);
            }
            else
            {
                LogError($"Room with name {roomNameClaim} couldn't be found");
            }
        }

        private static string? GetClaim(ClaimsPrincipal user, string claimType)
        {
            return user.FindFirst(claimType)?.Value;
        }

        private void LogInfo(string message) => log.Info(message);

        private void LogError(string message) => log.Error(message);
    }
}


