using EWiki.Api.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.DataAccess
{
    public class PokedexService
    {
        private readonly IPokedexRepository _pokedexRepository;
        private readonly IUnitOfWork _unitOfWork;

        public PokedexService(IPokedexRepository repository, IUnitOfWork unitOfWork)
        {
            _pokedexRepository = repository;
            _unitOfWork = unitOfWork;
        }

        public async Task<IEnumerable<Pokedex>> GetPokedexesAsync()
        {
            IQueryable<Pokedex> pokemons = _pokedexRepository.Queryable();
            List<Pokedex> result = await pokemons.ToListAsync();

            return result;
        }
    }
}
