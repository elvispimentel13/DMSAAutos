namespace DMSAAutos.Domain.Models;

public partial class Sales : IAggregateRoot
{
    public int SaleId { get; set; }
    public int InventoryId { get; set; }
    public DateTime SaleDate { get; set; }
    public int DealerId { get; set; }
    public string DealerName { get; set; } = null!;
    public int AgentId { get; set; }
    public string AgentFullName { get; set; } = null!;
    public string? AgentEmail { get; set; }
    public string AgentCode { get; set; } = null!;
    public int CustomerId { get; set; }
    public string CustomerFullName { get; set; } = null!;
    public string? CustomerEmail { get; set; }
    public string? InventoryDescription { get; set; }
    public string? Vin { get; set; }
    public decimal Price { get; set; }
}
