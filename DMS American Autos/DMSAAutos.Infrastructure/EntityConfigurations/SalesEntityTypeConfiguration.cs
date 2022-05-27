namespace DMSAAutos.Infrastructure.EntityConfigurations;
public class SalesEntityTypeConfiguration : IEntityTypeConfiguration<Sales>
{
    public void Configure(EntityTypeBuilder<Sales> builder)
    {
        builder.ToView("vw_sales", "Vehicles");

        builder.HasKey(ct => ct.SaleId);

        builder.Property(ct => ct.SaleId)
            .HasDefaultValue(1)
            .ValueGeneratedNever()
            .IsRequired();
    }
}
