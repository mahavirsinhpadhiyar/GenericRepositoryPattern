# GRP (Generic Repository Pattern)

GRP is Generic Repository Pattern which is useful for database operation with any kind of ORM system.

Currently it has following methods which you can use for database operations:

  - AddAsync
  - AddRangeAsync
  - RemoveAsync
  - RemoveRangeAsync
  - UpdateAsync
  - UpdateRangeAsync
  - FirstOrDefaultAsync
  - GetQueryDataAsync
  - GetQueryDataAsync (with custom columns)
  - GetAllAsync (with navigation properties [foreign key tables])
  - GetAllAsync

You can also:
  - Change all the methods as per your requirements
  - Add your own methods that is useful for your system.

### Packages used

Following are the packages which are used in current app:

* [Collections.Generic] - Generics is a technique that enriches programs to maximize code reuse, type safety, and performance.!
* [Linq.Expressions] - Linq expressions used to assign dynamic expressions as parameters. 
* [Threading.Tasks] - (Task, await and async) Task can represent any result that will be available in the future (general), not just a computation. This is especially important with async-await, which uses Tasks for asynchronous operations. Since the operation that gets the result might fail, Tasks can also represent failures..

### Development

Want to contribute? Great!

Send us your request or change in existing code and show us we will allow you to contribute for the code.

### Todos

 - RemoveAsync using primary key only.
 - Join over multiple foreign key / related tables.
