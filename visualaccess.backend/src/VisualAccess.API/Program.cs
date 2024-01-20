using log4net;
using log4net.Config;
using Microsoft.EntityFrameworkCore;
using VisualAccess.API;
using VisualAccess.API.Middlewares;
using VisualAccess.DataAccess.Context;

XmlConfigurator.Configure(new FileInfo("Log/log.config"));
ILog log = LogManager.GetLogger("API");

var builder = WebApplication.CreateBuilder(args);

builder.Logging.ClearProviders();


builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddConfig();

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;
    var dbContext = services.GetRequiredService<VisualAccessDbContext>();
    dbContext.Database.Migrate();
}

app.UseCors();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseMiddleware<StartRequestMiddleware>();

app.UseMiddleware<EndRequestMiddleware>();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

log.Info("Server has started");

var cancellationToken = new CancellationTokenSource();

Console.CancelKeyPress += (sender, e) =>
{
    e.Cancel = true;
    cancellationToken.Cancel();
    log.Info("Shutdown initiated...");
};

await app.RunAsync(cancellationToken.Token);

log.Info("Server has stopped");


