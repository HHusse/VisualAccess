using System;
using log4net;

namespace VisualAccess.API.Middlewares
{
    public class StartRequestMiddleware
    {
        private readonly RequestDelegate next;
        private readonly ILog log;

        public StartRequestMiddleware(RequestDelegate next, ILog log)
        {
            this.next = next;
            this.log = log;
        }

        public async Task Invoke(HttpContext context)
        {
            var forwardedFor = context.Request.Headers["X-Forwarded-For"].FirstOrDefault();
            var ipAddress = forwardedFor ?? context.Connection.RemoteIpAddress?.ToString();

            log.Info($"Request: {context.Request.Protocol} {context.Request.Method} {context.Request.Path} from IP: {ipAddress}");

            await next(context);
        }
    }
}

