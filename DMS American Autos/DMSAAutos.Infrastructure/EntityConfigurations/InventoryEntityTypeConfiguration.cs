namespace DMSAAutos.Infrastructure.EntityConfigurations;

public class InventoryEntityTypeConfiguration : IEntityTypeConfiguration<Inventory>
{
    public void Configure(EntityTypeBuilder<Inventory> builder)
    {
        builder.ToView("vw_inventory", "Vehicles");
        
        builder.HasKey(ct => ct.InventoryId);

        builder.Property(ct => ct.InventoryId)
            .HasDefaultValue(1)
            .ValueGeneratedNever()
            .IsRequired();
        
    }
}
