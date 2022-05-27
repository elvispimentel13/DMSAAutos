namespace DMSAAutos.Infrastructure;

/// <summary>
/// Context creation phase, initializacion of our db objects (based on configuration set in EntityTypeConfigurations)
/// Abstraction for saving context (for UnitOfWork and CQRS abstraction).
/// CQRS: for saving context, you need to have a command structure and handles that manage submitting changes to the persistency layer.
/// UoW: uses dependency injection to 
/// </summary>
public class VehiclesContext : DbContext, IUnitOfWork
{
    public virtual DbSet<Inventory> Inventories { get; set; } = null!;
    public virtual DbSet<Sales> Sales { get; set; } = null!;

    public VehiclesContext(DbContextOptions<VehiclesContext> options) : base(options) { }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new InventoryEntityTypeConfiguration());
        modelBuilder.ApplyConfiguration(new SalesEntityTypeConfiguration());
    }

    public async Task<bool> SaveEntitiesAsync(CancellationToken cancellationToken = default(CancellationToken))
    {
        var result = await base.SaveChangesAsync(cancellationToken);
        return true;
    }
}
