using MongoDB.Driver;
using TweetService;
using TweetService.Models;
using Prometheus;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowFrontend", builder =>
    {
        builder.WithOrigins("http://localhost:8085")
               .AllowAnyHeader()
               .AllowAnyMethod();
        
        builder.allowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
    });
});


//var listener = new RabbitMqListener();
//listener.StartListening();

var app = builder.Build();


// Add Prometheus middleware to expose metrics
app.UseMetricServer(); // Exposes metrics at /metrics
app.UseHttpMetrics();  // Collects HTTP request metrics

// Example endpoint
app.MapGet("/api/tweets", () => "New tweet made!!!");

app.UseCors("AllowFrontend");

app.MapControllers();

app.Run();
