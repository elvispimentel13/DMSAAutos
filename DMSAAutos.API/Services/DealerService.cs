namespace DMSAAutos.API.Services;

public class DealerService : IDealerService
{
    private readonly IMapper _mapper;
    private readonly IDealersRepository _dealerRepository;

    public DealerService(IMapper mapper,
                         IDealersRepository dealersRepository)
    {
        //Adding guards for null arguments (throw exception).
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        _dealerRepository = dealersRepository ?? throw new ArgumentNullException(nameof(dealersRepository));
    }
    public async Task<IEnumerable<InventoryDto>> GetDealerInventoryAsync(string dealerName)
    {
        throw new NotImplementedException();
        /*
        if (string.IsNullOrEmpty(dealerName)) throw new Exception("Dealer cannot be null or empty.");
        switch (dealerName.ToLower())
        {
            case "dealer1":
                var resultOne = _dealersRepository.GetDealerOneInventoryAsync();
                return await _mapper.ProjectTo<InventoryDto>(resultOne).ToArrayAsync();
            case "dealer2":
                var resultTwo = _dealersRepository.GetDealerTwoInventoryAsync();
                return await _mapper.ProjectTo<InventoryDto>(resultTwo).ToArrayAsync();
            default: throw new Exception("Not implemented dealer.");
        }
        */
    }
}
