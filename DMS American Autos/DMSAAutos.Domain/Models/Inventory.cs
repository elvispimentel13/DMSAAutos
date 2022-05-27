namespace DMSAAutos.Domain.Models;

public partial class Inventory: IAggregateRoot
{
    public int InventoryId { get; set; }
    public int DealerId { get; set; }
    public string DealerName { get; set; } = null!;
    public int MakeId { get; set; }
    public string MakeName { get; set; } = null!;
    public int ModelId { get; set; }
    public string ModelName { get; set; } = null!;
    public int ColorId { get; set; }
    public string Color { get; set; } = null!;
    public int AvailabilityId { get; set; }
    public virtual string AvailabilityDescription { get; set; } = null!;
    public virtual string? DisplayName { get; set; }
    public string? TransmissionType { get; set; }
    public string? FuelType { get; set; }
    public int? PassengerCapatity { get; set; }
    public string? Vin { get; set; }
    public decimal Price { get; set; }
    public int Odometer { get; set; }
    public string OdometerUnit { get; set; } = null!;
    public int VehicleYear { get; set; }
    public string Condition { get; set; } = null!;
    public string? Description { get; set; }
    public DateTime InventoryDate { get; set; }
}
