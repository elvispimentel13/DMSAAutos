namespace DMSAAutos.API.Models.DataTransferObjects;
public record DealerDto
{
    public int InventoryId { get; init; }
    public int DealerId { get; init; }
    public string DealerName { get; init; }
    public string MakeName { get; init; }
    public string ModelName { get; init; } = null!;
    public string Color { get; init; } = null!;
    public string? DisplayName { get; init; }
    public string? TransmissionType { get; init; }
    public string? FuelType { get; init; }
    public int? PassengerCapatity { get; init; }
    public string? Vin { get; init; }
    public decimal Price { get; init; }
    public int Odometer { get; init; }
    public int VehicleYear { get; init; }
    public string VehicleStatus { get; init; }
    
}