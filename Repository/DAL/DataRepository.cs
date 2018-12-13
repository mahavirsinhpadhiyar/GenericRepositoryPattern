using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace Repository.DAL
{
    public class DataRepository<T> : IDataRepository<T> where T : class
    {
        /// <summary>
        /// Adds single record
        /// </summary>
        /// <param name="item">record to be added</param>
        /// <returns>returns true if record gets added successfully else false</returns>
        public async Task<bool> AddAsync(T item)
        {
            using (var context = new SpotlightEntities())
            {
                context.Entry(item).State = EntityState.Added;
                return await context.SaveChangesAsync() == 1;
            }
        }

        /// <summary>
        /// Adds multiple records
        /// </summary>
        /// <param name="items">collection of records to be added</param>
        /// <returns>returns true if record gets added successfully else false</returns>
        public async Task<bool> AddRangeAsync(IEnumerable<T> items)
        {
            using (var context = new SpotlightEntities())
            {
                using (DbContextTransaction transaction = context.Database.BeginTransaction())
                {
                    foreach (var item in items)
                        context.Entry(item).State = EntityState.Added;

                    var Result = await context.SaveChangesAsync() == items.Count();
                    if (Result)
                    {
                        transaction.Commit();
                        return true;
                    }
                    else
                    {
                        transaction.Rollback();
                        return false;
                    }
                }
            }
        }

        /// <summary>
        /// can specify condition using which data will be filtered and can also specifiy which foreign key column data to be fetched
        /// </summary>
        /// <param name="where">Where condition</param>
        /// <param name="navigationProperties">foreign key columns for which data to be fetched</param>
        /// <returns></returns>
        public async Task<T> FirstOrDefaultAsync(Func<T, bool> where, params Expression<Func<T, object>>[] navigationProperties)
        {
            using (var context = new SpotlightEntities())
            {
                IQueryable<T> dbQuery = context.Set<T>();

                //Apply eager loading
                foreach (Expression<Func<T, object>> navigationProperty in navigationProperties)
                    dbQuery = dbQuery.Include<T, object>(navigationProperty);

                return await Task.Run(() =>
                {
                    return dbQuery.AsNoTracking().Where(where).FirstOrDefault<T>();
                });
            }
        }

        /// <summary>
        /// Example how to use this method
        /// await department.GetQueryDataAsync<dynamic>(i => i.Department1.StartsWith("Department"),
        ///   i => new { i.Id, i.Department1, i.IsActive, i.Division.Division1 },
        ///   i =>  new { i.Department1, i.Division.Division1 }, true, i =>i.Division);
        /// </summary>
        /// <typeparam name="TReturn">specify the type of object which this method will return</typeparam>
        /// <param name="whereExp">Where condition</param>
        /// <param name="selectExp">Select expression(Provide fields/columns needed in result object)</param>
        /// <param name="orderExp">order expression (Provide fields/columns) by which result to be sorted</param>
        /// <param name="descending">default is ascending. if result needed in descending order then pass true in this argument</param>
        /// <param name="includeExps">foreign key fields which needs to be populated</param>
        /// <returns>returns object of type TReturn</returns>
        public async Task<IList<TReturn>> GetQueryDataAsync<TReturn>(Expression<Func<T, bool>> whereExp,
                                                               Expression<Func<T, TReturn>> selectExp,
                                                               Expression<Func<T, TReturn>> orderExp = null,
                                                               bool? descending = null,
                                                               params Expression<Func<T, object>>[] includeExps)
        {
            using (var context = new SpotlightEntities())
            {
                IQueryable<T> query = context.Set<T>();

                if (whereExp != null)
                {
                    query = query.Where(whereExp);
                }

                if (orderExp != null)
                {
                    if (descending.HasValue)
                    {
                        query = descending.Value ? query.OrderByDescending(orderExp) : query.OrderBy(orderExp);
                    }
                    else
                    {
                        query = query.OrderBy(orderExp);
                    }
                }

                foreach (Expression<Func<T, object>> navigationProperty in includeExps)
                    query = query.Include<T, object>(navigationProperty);

                return await query.Select(selectExp).ToListAsync();
            }
        }

        /// <summary>
        /// Example how to use this method
        /// await department.GetQueryDataAsync(i => i.Department1.StartsWith("Department"),
        ///                                                                         i =>  new { i.Department1, i.Division.Division1 }, true, i =>i.Division);
        /// </summary>
        /// <typeparam name="TReturn">specify the type of object which this method will return</typeparam>
        /// <param name="whereExp">Where condition</param>
        /// <param name="orderExp">order expression (Provide fields/columns) by which result to be sorted</param>
        /// <param name="descending">default is ascending. if result needed in descending order then pass true in this argument</param>
        /// <param name="includeExps">foreign key fields which needs to be populated</param>
        /// <returns>returns object of type T</returns>
        public async Task<IList<T>> GetQueryDataAsync(Expression<Func<T, bool>> whereExp,
                                                               Expression<Func<T, object>> orderExp = null,
                                                               bool? descending = null,
                                                               params Expression<Func<T, object>>[] includeExps)
        {
            using (var context = new SpotlightEntities())
            {
                IQueryable<T> query = context.Set<T>();

                if (whereExp != null)
                {
                    query = query.Where(whereExp);
                }

                if (orderExp != null)
                {
                    if (descending.HasValue)
                    {
                        query = descending.Value ? query.OrderByDescending(orderExp) : query.OrderBy(orderExp);
                    }
                    else
                    {
                        query = query.OrderBy(orderExp);
                    }
                }

                if (includeExps != null)
                    query = includeExps.Aggregate(query, (current, exp) => current.Include(exp));

                return await query.ToListAsync();
            }
        }

        /// <summary>
        /// Gets all records in table
        /// </summary>
        /// <returns></returns>
        public async Task<IList<T>> GetAllAsync()
        {
            using (var context = new SpotlightEntities())
            {
                IQueryable<T> dbQuery = context.Set<T>();

                return await dbQuery.AsNoTracking().ToListAsync<T>();
            }
        }

        /// <summary>
        /// Gets all records in table with foreign table data
        /// </summary>
        /// <param name="navigationProperties">Include eager loading to get foreign table data</param>
        /// <returns></returns>
        public async Task<IList<T>> GetAllAsync(params System.Linq.Expressions.Expression<Func<T, object>>[] navigationProperties)
        {
            using (var context = new SpotlightEntities())
            {
                IQueryable<T> dbQuery = context.Set<T>();

                foreach (Expression<Func<T, object>> navigationProperty in navigationProperties)
                    dbQuery = dbQuery.Include<T, object>(navigationProperty);

                return await dbQuery.AsNoTracking().ToListAsync<T>();
            }
        }

        /// <summary>
        /// Remove single record
        /// </summary>
        /// <param name="item">record to be removed</param>
        /// <returns>returns true if record gets added successfully else false</returns>
        public async Task<bool> RemoveAsync(T item)
        {
            using (var context = new SpotlightEntities())
            {
                context.Entry(item).State = EntityState.Deleted;
                var count = await context.SaveChangesAsync();

                return count == 1;
            }
        }

        /// <summary>
        /// Example how to use this method
        /// await department.GetQueryDataAsync(i => i.Id == Id);
        /// </summary>
        /// <returns>Rertuns </returns>
        public async Task<bool> RemoveAsync(Expression<Func<T, bool>> whereExp)
        {
            using (var context = new SpotlightEntities())
            {
                var item = context.Set<T>().FirstOrDefault(whereExp);

                context.Entry(item).State = EntityState.Deleted;
                var count = await context.SaveChangesAsync();

                return count > 0;
            }
        }

        /// <summary>
        /// Removes multiple records
        /// </summary>
        /// <param name="items">collection of records to be removed</param>
        /// <returns>returns true if record gets added successfully else false</returns>
        public async Task<bool> RemoveRangeAsync(IEnumerable<T> items)
        {
            using (var context = new SpotlightEntities())
            {
                using (DbContextTransaction transaction = context.Database.BeginTransaction())
                {
                    foreach (var item in items)
                        context.Entry(item).State = EntityState.Deleted;
                    var count = await context.SaveChangesAsync();

                    if (count == items.Count())
                    {
                        transaction.Commit();
                        return true;
                    }
                    else
                    {
                        transaction.Rollback();
                        return false;
                    }
                }
            }
        }

        /// <summary>
        /// Updates record
        /// </summary>
        /// <param name="item">record to be updated</param>
        /// <returns>returns true if update is successful else returns false</returns>
        public async Task<bool> UpdateAsync(T item)
        {
            using (var context = new SpotlightEntities())
            {
                context.Entry(item).State = EntityState.Modified;

                return await context.SaveChangesAsync() == 1;
            }
        }

        /// <summary>
        /// Updates multiple records
        /// </summary>
        /// <param name="items">records to be updated</param>
        /// <returns>returns true if update is successful else returns false</returns>
        public async Task<bool> UpdateRangeAsync(IEnumerable<T> items)
        {
            using (var context = new SpotlightEntities())
            {
                foreach (var item in items)
                    context.Entry(item).State = EntityState.Modified;

                return await context.SaveChangesAsync() == items.Count();
            }
        }
    }
}