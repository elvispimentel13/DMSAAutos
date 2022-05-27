namespace DMSAAutos.Domain.Models;
/// <summary>
/// This class purpose is to demostrate inheritance as requested.
/// Access modifier sealed because not need to inherit from this class.
/// </summary>
public sealed class DealerTwo : Inventory
{
    private string _itemStatus;
    public override string AvailabilityDescription
    {
        set
        {
            ///Will be same result but it's a demostration as requested.
            _itemStatus = (!string.IsNullOrWhiteSpace(value) &&
                            value.Equals("Active")) ? "Active" : value;
        }
        get
        {
            return _itemStatus;
        }
    }
}
