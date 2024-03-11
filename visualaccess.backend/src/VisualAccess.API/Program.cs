using log4net;
using log4net.Config;
using Microsoft.EntityFrameworkCore;
using VisualAccess.API;
using VisualAccess.API.Middlewares;
using VisualAccess.DataAccess.Contexts;

XmlConfigurator.Configure(new FileInfo("Log/log.config"));
LogicalThreadContext.Properties["CorrelationId"] = Guid.NewGuid().ToString();
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
    var dbContextPgSQL = services.GetRequiredService<VisualAccessDbContextPgSql>();
    dbContextPgSQL.Database.Migrate();
    var dbContextMongoDB = services.GetRequiredService<VisualAccessDbContextMongoDB>();
    dbContextMongoDB.Configure();
}

app.UseCors();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseMiddleware<CorrelationIdMiddleware>();

app.UseMiddleware<StartRequestMiddleware>();

app.UseMiddleware<ExtractionMiddleware>();

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

cancellationToken.Dispose();
log.Info("Server has stopped");

