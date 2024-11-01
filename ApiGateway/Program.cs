using Ocelot.DependencyInjection;
using Ocelot.Middleware;

var builder = WebApplication.CreateBuilder(args);

// Load Ocelot configuration from JSON file
builder.Configuration.AddJsonFile("ocelot.json", optional: false, reloadOnChange: true);

// Add Ocelot to the service collection
builder.Services.AddOcelot(builder.Configuration);

var app = builder.Build();

// Use Ocelot middleware to route requests
app.UseOcelot().Wait();

app.Run();
