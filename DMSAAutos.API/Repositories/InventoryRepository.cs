namespace DMSAAutos.API.Repositories;

public class InventoryRepository : IInventoryRepository
{
    private readonly VehiclesContext _context;
    public IUnitOfWork UnitOfWork => _context;

    public InventoryRepository(VehiclesContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<Inventory>> GetInventoryAsync()
    {
        var inventory = await _context.Inventories
                                      .OrderByDescending(o => o.Price)
                                      .ThenBy(m => m.ModelName)
                                      .ThenBy(p => p.Price)
                                      .ToArrayAsync();
        return inventory;
    }

    /// <summary>
    /// Here we implement access to default context and local context but not in list all items. The reason is, in CQRS pattern, you manage commands
    /// </summary>
    public async Task<Inventory> GetInventoryItemAsync(int inventoryId)
    {
        var inventoryItem = await _context.Inventories.FirstOrDefaultAsync(i => i.InventoryId == inventoryId);
        if (inventoryItem == null)
            inventoryItem = _context.Inventories.Local.FirstOrDefault(i => i.InventoryId == inventoryId);
        return inventoryItem;
    }

    /// <summary>
    /// Return inventory by dealerName, ordered by requested condition: 
    /// This order can be conditional by front-end parameter and execute the order process:
    ///     - At DB with Stored Procedure
    ///     - At dbContext querying when filtering values (as example below)
    ///     - In same App Front-End Table
    /// For demostration, we implemented a basic fixed ordering.
    /// PD: this method does the same as GetDealerInventoryAsync() below.
    /// </summary>
    /// <param name="dealerName"></param>
    /// <returns></returns>
    public async Task<IEnumerable<Inventory>> GetInventoryAsync(string dealerName)
    {
        var inventory = await _context.Inventories.Where(d=>d.DealerName == dealerName)
                                                  .OrderBy(o=> o.Price)
                                                  .ThenBy(m=>m.ModelName)
                                                  .ThenBy(p=>p.Price)
                                                  .ToArrayAsync();
        return inventory;
    }
}