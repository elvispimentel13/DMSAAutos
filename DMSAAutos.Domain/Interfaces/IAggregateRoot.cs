namespace DMSAAutos.Domain.Interfaces;

/// <summary>
/// This is our marker interface for repository pattern enforces every request to our context needs to come from an implementation of contracts defined to that purposes.
/// Lets say: IInventoryRepository<T> where T : IAggregateRoot, any changes to Vehicles context, needs to be done inside of it, ensuring that vehicles are persisted here, not clients, not anything else.
/// Hint: this is a marker interface, not a restriction is just a guard to prevent other behavior and let other programmers know what is done here.
/// </summary>
public interface IAggregateRoot { }
