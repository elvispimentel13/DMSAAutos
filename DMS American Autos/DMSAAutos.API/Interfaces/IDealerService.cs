namespace DMSAAutos.Domain.Interfaces;

public interface IDealerService
{
    Task<IEnumerable<InventoryDto>> GetDealerInventoryAsync(string dealerName);
}
