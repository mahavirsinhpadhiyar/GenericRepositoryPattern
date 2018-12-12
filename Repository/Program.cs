using Repository.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository
{
    class Program
    {
        static void Main(string[] args)
        {
            Task.Run(async () =>
            {
                DataRepository<Department> department = new DataRepository<Department>();

                DataRepository<Division> divisionRepository = new DataRepository<Division>();

                var divisionListData = await divisionRepository.GetQueryDataAsync(d => d.IsActive == true);

                var departments = await department.FirstOrDefaultAsync(i => i.Department1.StartsWith("Department"), i => i.Division, i => i.Division);

                var result = await department.GetQueryDataAsync<dynamic>(i => i.Department1.StartsWith("Department"),
                                                                                                            i => new { i.Id, i.Department1, i.IsActive, i.Division.Division1 }, 
                                                                                                            i =>  new { i.Department1, i.Division.Division1 }, true, i =>i.Division);

                Console.ReadLine();
            });
            Console.ReadLine();
        }
    }
}
