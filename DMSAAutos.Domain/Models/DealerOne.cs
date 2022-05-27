namespace DMSAAutos.Domain.Models;
/// <summary>
/// This class purpose is to demostrate inheritance as requested.
/// Access modifier sealed because not need to inherit from this class.
/// </summary>
public sealed class DealerOne : Inventory
{
    private string _displayName;
    public override string DisplayName
    {
        set
        {
            _displayName = this.TransformDisplayName(value);
        }
        get { 
            return _displayName;
        }

    }

    public string TransformDisplayName(string displayName)
    {
        return $"Car: {displayName.ToUpper()} - Dealer(1)";
    }
}
