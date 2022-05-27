namespace DMSAAutos.API.Interfaces;

public interface IInventoryRepository : IRepository<Inventory>
{
    Task<IEnumerable<Inventory>> GetInventoryAsync();
    Task<Inventory> GetInventoryItemAsync(int inventoryId);
    Task<IEnumerable<Inventory>> GetInventoryAsync(string dealerName);
}