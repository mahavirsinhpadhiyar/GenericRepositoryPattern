using Repository.DAL;
using System;
using System.Threading.Tasks;

namespace Repository
{
    class Program
    {
        static void Main(string[] args)
        {
            //Test demo
            Task.Run(async () =>
            {
                DataRepository<Country> country = new DataRepository<Country>();

                DataRepository<State> state = new DataRepository<State>();

                var stateListData = await state.GetAllAsync();

                var countries = await country.FirstOrDefaultAsync(i => i.CountryName.StartsWith("India"), i => i.States);

                var result = await state.GetQueryDataAsync<dynamic>(i => i.StateName.StartsWith("Delhi"),
                                                                                                            i => new { i.StateId, i.StateName, i.Country.CountryName }, 
                                                                                                            i =>  new { i.StateId, i.Country.CountryName }, true, i =>i.Cities);

                Console.ReadLine();
            });
            Console.ReadLine();
        }
    }
}
