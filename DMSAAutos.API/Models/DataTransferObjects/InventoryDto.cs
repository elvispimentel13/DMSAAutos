namespace DMSAAutos.API.Models.DataTransferObjects;

/// <summary>
/// Since c# v9, we can use Record reference type to define our DTOs
/// Record have init only (Init Only Setters) props that prevent immutability (as DTOs purpose are).
/// </summary>
public record InventoryDto
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
    public string Condition { get; init; }
    public DateTime InventoryDate { get; init; }

    public string VehicleStatus { get; init; }
}