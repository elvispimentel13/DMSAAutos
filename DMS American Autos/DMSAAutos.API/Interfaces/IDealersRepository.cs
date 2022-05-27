namespace DMSAAutos.API.Interfaces;

public interface IDealersRepository : IRepository<DealerOne>, IRepository<DealerTwo>
{
    /// <summary>
    /// For assignment only.
    /// In a simple logic implementation, with methods in IInventoryRepository, will be sufficient.
    /// These methods are IQueryable because we dont need to impact the DB until we process our convertion in IMapper convertion to DTOs objects,
    /// and for that, mapper process items to convert them to desired type.
    /// </summary>
    Task<IEnumerable<DealerOne>> GetDealerOneInventoryAsync(string dealerName);

    Task<IEnumerable<DealerTwo>> GetDealerTwoInventoryAsync(string dealerName);
}
