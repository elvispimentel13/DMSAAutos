namespace DMSAAutos.API.Repositories;

public class DealerRepository: IDealersRepository
{
    private readonly VehiclesContext _context;
    public IUnitOfWork UnitOfWork => _context;
    private readonly IMapper _mapper;

    public DealerRepository(VehiclesContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    /// <summary>
    /// Method below is for assignment only, methods already implemented in IIventoryRepository are sufficient.
    /// </summary>

    public async Task<IEnumerable<DealerOne>> GetDealerOneInventoryAsync(string dealerName = "dealer1")
    {
        var dealer = await _context.Inventories.Where(d => d.DealerName == dealerName)
                                               .OrderBy(o => o.Price)
                                               .ThenBy(m => m.ModelName)
                                               .ThenBy(p => p.Price)
                                               .ToArrayAsync();
        return _mapper.Map<IEnumerable<DealerOne>>(dealer);
    }

    public async Task<IEnumerable<DealerTwo>> GetDealerTwoInventoryAsync(string dealerName = "dealer2")
    {
        var dealer = await _context.Inventories.Where(d => d.DealerName == dealerName)
                                               .OrderBy(o => o.Price)
                                               .ThenBy(m => m.ModelName)
                                               .ThenBy(p => p.Price)
                                               .ToArrayAsync();
        return _mapper.Map<IEnumerable<DealerTwo>>(dealer);
    }
}
