namespace DMSAAutos.Domain.Interfaces;

/// <summary>
/// Implementing Unit of Work pattern.
/// This pattern allows to encapsulate our access to the context which allow us to make changes through these methods only.
/// There is two saving methods, one to save changes to any table, other to save changes to entities.
/// CancellationToken is to receive a token instance of this class, to receive a notification in case there is a cancellation of thread from the caller.
/// </summary>
public interface IUnitOfWork : IDisposable
{
    Task<bool> SaveEntitiesAsync(CancellationToken cancellationToken = default);
}