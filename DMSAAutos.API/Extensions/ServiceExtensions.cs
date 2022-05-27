namespace DMSAAutos.API.Extensions;

public static class ServiceExtensions
{
    /// <summary>
    /// CORS (Cross-Origin Resource Sharing) is mandatory
    /// Our front-end site (Angular) is going to be hosted in a different domain as our api would be.
    /// To prevent same-origin policy to restrict our calls, CORS needs to be enabled and allow cross domain calls.
    /// </summary>
    /// <param name="services"></param>
    public static void ConfigureCors(this IServiceCollection services)
    {
        services.AddCors(options =>
        {
            options.AddPolicy("CorsPolicy",
                builder => builder.AllowAnyOrigin() //Any origin for now, can be .WithOrigins("SpecifiedDomain")
                .AllowAnyMethod()                   //WithMethods('GET', 'POST', 'PUT') etc.
                .AllowAnyHeader());
        });
    }

    /// <summary>
    /// Adding configurations to our context: connection, reconnection.
    /// </summary>
    /// <param name="services"></param>
    /// <param name="configuration"></param>
    /// <returns></returns>
    public static IServiceCollection AddCustomDbContext(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<VehiclesContext>(options =>
        {
            options.UseSqlServer(configuration["ConnectionStringDB"],
                sqlServerOptionsAction: sqlOptions =>
                {
                    sqlOptions.MigrationsAssembly(typeof(Program).GetTypeInfo().Assembly.GetName().Name);
                    sqlOptions.EnableRetryOnFailure(maxRetryCount: 15, maxRetryDelay: TimeSpan.FromSeconds(30), errorNumbersToAdd: null);
                });
        },
        ServiceLifetime.Scoped
        );

        return services;
    }

    /// <summary>
    /// Adding our repositories as services to app build process.
    /// </summary>
    /// <param name="services"></param>
    /// <returns></returns>
    public static IServiceCollection ConfigureServices(this IServiceCollection services)
    {
        services.AddScoped<IInventoryRepository, InventoryRepository>();
        services.AddScoped<IDealersRepository, DealerRepository>();
        services.AddAutoMapper(typeof(Program));
        return services;
    }
}
