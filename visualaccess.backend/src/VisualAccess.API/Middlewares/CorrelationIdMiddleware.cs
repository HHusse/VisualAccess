using Microsoft.AspNetCore.Http;
using log4net;
using System;
using System.Threading.Tasks;

public class CorrelationIdMiddleware
{
    private readonly RequestDelegate _next;

    public CorrelationIdMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task Invoke(HttpContext context)
    {
        var correlationId = Guid.NewGuid().ToString();
        LogicalThreadContext.Properties["CorrelationId"] = correlationId;

        context.Response.OnStarting(() =>
        {
            context.Response.Headers.Add("X-Correlation-ID", correlationId);
            return Task.CompletedTask;
        });

        await _next(context);
    }
}
