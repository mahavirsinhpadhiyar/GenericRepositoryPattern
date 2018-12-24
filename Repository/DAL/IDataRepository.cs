using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Repository.DAL
{
    public interface IDataRepository<T> where T : class
    {
        Task<bool> AddAsync(T item);

        Task<bool> AddRangeAsync(IEnumerable<T> item);

        Task<T> FirstOrDefaultAsync(Func<T, bool> where, params Expression<Func<T, object>>[] navigationProperties);

        Task<List<T>> GetQueryDataAsync(Expression<Func<T, bool>> whereExp,
                                                       Expression<Func<T, object>> orderExp = null,
                                                       bool? descending = null,
                                                       params Expression<Func<T, object>>[] includeExps);

        Task<List<TReturn>> GetQueryDataAsync<TReturn>(Expression<Func<T, bool>> whereExp,
                                                               Expression<Func<T, TReturn>> selectExp,
                                                               Expression<Func<T, TReturn>> orderExp = null,
                                                               bool? descending = null,
                                                               params Expression<Func<T, object>>[] includeExps);

        Task<List<T>> GetAllAsync(params Expression<Func<T, object>>[] navigationProperties);

        Task<List<T>> GetAllAsync();

        Task<bool> RemoveAsync(T item);

        Task<bool> RemoveRangeAsync(IEnumerable<T> item);

        Task<bool> UpdateAsync(T item);

        Task<bool> UpdateRangeAsync(IEnumerable<T> item);
    }
}