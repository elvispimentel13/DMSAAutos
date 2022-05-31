namespace DMSAAutos.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class InventoryController : ControllerBase
{
    /// <summary>
    /// Here we declare our logger field that will be initialize in controller constructor when app services are initialized from Program.cs
    /// This field will hold the Telemetry implementation from Azure Application Insights that uses ILogger interface to write logs into azure containers.
    /// </summary>
    private readonly ILogger<InventoryController> _logger;
    private readonly IInventoryRepository _inventoryRepository;
    private readonly IDealersRepository _dealersRepository;
    private readonly IMapper _mapper;

    public InventoryController(
        ILogger<InventoryController> logger,
        IInventoryRepository inventoryRepository,
        IDealersRepository dealersRepository,
        IMapper mapper
    )
    {
        //Adding guards for null arguments (throw exception).
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _inventoryRepository = inventoryRepository ?? throw new ArgumentNullException(nameof(inventoryRepository));
        _dealersRepository = dealersRepository ?? throw new ArgumentNullException(nameof(dealersRepository));
        _mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
    }

    [Route("list")]
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<InventoryDto>), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    [ProducesResponseType((int)HttpStatusCode.InternalServerError)]
    public async Task<ActionResult<IEnumerable<InventoryDto>>> GetInventoryAsync()
    {
        try
        {
            var inventory = await _inventoryRepository.GetInventoryAsync();
            if (inventory == null || !inventory.Any())
            {
                string inventoryEmpty = $"Not inventory items GetInventoryAsync().";
                _logger.LogWarning(inventoryEmpty);
                return NotFound(inventoryEmpty);
            }
            return Ok(_mapper.Map<IEnumerable<InventoryDto>>(inventory));
        }
        catch (Exception ex)
        {
            _logger.LogError($"--- Error Loading Inventory: GetInventoryAsync() - Exception {ex.Message}.");
            return StatusCode(500, "Internal server error");
        }
    }

    [Route("item/{inventoryId:int}")]
    [HttpGet]
    [ProducesResponseType(typeof(InventoryDto), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    [ProducesResponseType((int)HttpStatusCode.InternalServerError)]
    public async Task<ActionResult<InventoryDto>> GetInventoryItemAsync(int inventoryId)
    {
        try
        {
            var inventoryItem = await _inventoryRepository.GetInventoryItemAsync(inventoryId);

            ///Guard to return not found in case no item found.
            if (inventoryItem == null)
            {
                string itemNull = $"Not item found GetInventoryItemAsync({inventoryId}).";
                _logger.LogWarning(itemNull);
                return NotFound(itemNull);
            }
            return Ok(_mapper.Map<InventoryDto>(inventoryItem));
        }
        catch (Exception ex)
        {
            _logger.LogError($"--- Error Retrieving Inventory Item: GetInventoryItemAsync(inventoryId:{inventoryId})", ex);
            return StatusCode(500, "Internal server error");
        }
    }

    [Route("list/{dealerName}")]
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<InventoryDto>), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    [ProducesResponseType((int)HttpStatusCode.InternalServerError)]
    public async Task<ActionResult<IEnumerable<InventoryDto>>> GetFilteredInventoryAsync(string dealerName)
    {
        try
        {
            if (string.IsNullOrWhiteSpace(dealerName))
            {
                string dealerNameInvalid = $"Dealer name is invalid at GetFilteredInventoryAsync({dealerName})";
                _logger.LogWarning(dealerNameInvalid);
                return NotFound(dealerNameInvalid);
            }
            dealerName = ExtensionMethods.ReplaceWhitespace(dealerName);
            var dealerInventory = await _inventoryRepository.GetInventoryAsync(dealerName);
            if (dealerInventory == null || !dealerInventory.Any())
            {
                string dealerInventoryEmpty = $"No inventory found for dealer {dealerName} at GetFilteredInventoryAsync({dealerName})";
                _logger.LogWarning(dealerInventoryEmpty);
                return NotFound(dealerInventoryEmpty);
            }
            return Ok(_mapper.Map<IEnumerable<InventoryDto>>(dealerInventory));
        }
        catch (Exception ex)
        {
            _logger.LogError($"--- Error Retrieving Filtered Inventory by Dealer: GetFilteredInventoryAsync(dealer:{dealerName})", ex);
            return StatusCode(500, "Internal server error");
        }
    }


    /// <summary>
    /// As requested: this action return a list of items inventory filtered by dealer1/dealer2
    /// Because is a business logic, we added an intermediate call to apply specific rules requested.
    /// </summary>
    /// <param name="dealerName"></param>
    /// <returns></returns>
    [Route("assignment/{dealerName}")]
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<DealerDto>), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.NotFound)]
    [ProducesResponseType((int)HttpStatusCode.InternalServerError)]
    public async Task<ActionResult> GetDealerInventoryAsync(string dealerName)
    {
        try
        {
            //Prevent using db resources without need.
            if (string.IsNullOrWhiteSpace(dealerName))
            {
                string dealerNameInvalid = $"Dealer name is invalid at GetDealerInventoryAsync({dealerName})";
                _logger.LogWarning(dealerNameInvalid);
                return NotFound(dealerNameInvalid);
            }
            dealerName = ExtensionMethods.ReplaceWhitespace(dealerName);
            switch (dealerName)
            {
                case "dealer1":
                    var inventoryOne = await _dealersRepository.GetDealerOneInventoryAsync(dealerName);
                    if (inventoryOne == null || !inventoryOne.Any())
                    {
                        string emptyInventoryOne = $"Inventory for dealer: {dealerName}, is null or empty.";
                        _logger.LogCritical(emptyInventoryOne);
                        return NotFound(emptyInventoryOne);
                    }
                    return Ok(_mapper.Map<IEnumerable<DealerDto>>(inventoryOne));
                case "dealer2":
                    var inventoryTwo = await _dealersRepository.GetDealerTwoInventoryAsync(dealerName);
                    if (inventoryTwo == null || !inventoryTwo.Any())
                    {
                        string emptyInventoryTwo = $"Inventory for dealer: {dealerName}, is null or empty.";
                        _logger.LogCritical(emptyInventoryTwo);
                        return NotFound(emptyInventoryTwo);
                    }
                    return Ok(_mapper.Map<IEnumerable<DealerDto>>(inventoryTwo));
                default:
                    string notImplemented = $"Not Implemented Dealer: {dealerName}";
                    _logger.LogWarning(notImplemented);
                    return NotFound(notImplemented);
            }
        }
        catch (Exception ex)
        {
            _logger.LogWarning($"--- Error Retrieving Inventory by Dealer: GetDealerInventoryAsync(dealer:{dealerName}) -- {ex.Message}");
            return StatusCode(500, "Internal server error");
        }
    }
}