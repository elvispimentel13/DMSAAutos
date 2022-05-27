var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddApplicationInsightsTelemetry(builder.Configuration["APPLICATIONINSIGHTS_CONNECTION_STRING"]);

/// <summary>
/// Customizing swagger options.
/// </summary>
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "DMS American Autos",
        Version = "1.0",
        Description = "Dealers Assignment Elvis Pimentel"
    });
});

// Add services to the container.
/// <summary>
/// Adding our directives for CORS in our app pipeline.
/// </summary>
builder.Services.ConfigureCors();

/// <summary>
/// Initializing DBContext and connection.
/// </summary>
builder.Services.AddCustomDbContext(builder.Configuration);

/// <summary>
/// Initializing scoped services (repositories)
/// </summary>
builder.Services.ConfigureServices();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseStaticFiles();

/// <summary>
/// Forwarding proxy headers to the current request.
/// </summary>
app.UseForwardedHeaders(new ForwardedHeadersOptions
{
    ForwardedHeaders = ForwardedHeaders.All
});

/// <summary>
/// Adding ours CORS policy to app pipeline.
/// </summary>
app.UseCors("CorsPolicy");

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
