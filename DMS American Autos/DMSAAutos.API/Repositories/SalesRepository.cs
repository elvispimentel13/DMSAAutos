namespace DMSAAutos.API.Repositories;

public class SalesRepository : ISalesRepository
{
    private readonly VehiclesContext _context;
    public IUnitOfWork UnitOfWork => _context;
}
