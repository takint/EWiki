using Microsoft.AspNet.Identity.EntityFramework;
using EWiki.DataAccess.Infrastructure;
using EWiki.DataAccess.Infrastructure.Identity;
using EWiki.DataAccess.Services.ServiceInterfaces;
using EWiki.Entities.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using EWiki.DataAccess.Models;
using AutoMapper;
using System.Linq;
using System.Data.Entity;

namespace EWiki.DataAccess.Services
{
    public class PokedexService : Service<Pokedex>, IPokedexService
    {
        private readonly IRepository<Pokedex> _repository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly EWikiIdentityContext _ictx;
        private readonly EWikiUserManager _userManager;

        public PokedexService(IRepository<Pokedex> repository, IUnitOfWork unitOfWork) : base(repository)
        {
            this._repository = repository;
            this._unitOfWork = unitOfWork;
            _ictx = new EWikiIdentityContext();
            _userManager = new EWikiUserManager(new UserStore<User>(_ictx));
        }

        public async Task<IEnumerable<GetPokedexDTO>> GetPokedexesAsync(int skip, int take, string userFilter, string name)
        {
            IQueryable<Pokedex> pokemons = _repository.Queryable();
            List<Pokedex> result = await pokemons.ToListAsync();

            return result.Select(Mapper.Map<GetPokedexDTO>);
        }

        public async Task<GetPokedexDTO> GetPokemonAsync(string name)
        {
            try
            {
                Pokedex pokemon = await _repository.Queryable()
                                        .FirstOrDefaultAsync(p => p.Name.Contains(name));
                GetPokedexDTO pokemonDto = Mapper.Map<GetPokedexDTO>(pokemon);
                return pokemonDto;
            }
            catch (Exception ex)
            {
                throw new Exception(ResponseCodeString.DataGet_Error, ex.InnerException);
            }
        }

        public async Task<string> AddPokemon(NewPokedexDTO newPokemon, string userName)
        {
            try
            {
                User user = await _userManager.FindByNameAsync(userName);
                Pokedex pokemon = Mapper.Map<Pokedex>(newPokemon);

                pokemon.CreatedUserId = user.Id;
                pokemon.CreatedDate = DateTime.UtcNow;
                pokemon.UpdatedUserId = user.Id;
                pokemon.UpdatedDate = DateTime.UtcNow;

                _repository.Insert(pokemon);
                await _unitOfWork.SaveChangesAsync();

                // TODO: Set default value for new pokemon
                await _unitOfWork.SaveChangesAsync();

                return ResponseCodeString.ContentAdd_Success;
            }
            catch (Exception ex)
            {
                throw new Exception(ResponseCodeString.ContentAdd_Error, ex.InnerException);
            }
        }

        public async Task<string> UpdatePokedex(NewPokedexDTO updatePokemon, string userName)
        {
            try
            {
                User user = await _userManager.FindByNameAsync(userName);
                Pokedex pokemon = Mapper.Map<Pokedex>(updatePokemon);
                Pokedex beUpdatePokemon = _repository.Find(pokemon.Id);

                beUpdatePokemon.Name = pokemon.Name;
                beUpdatePokemon.Description = pokemon.Description;
                beUpdatePokemon.UpdatedDate = DateTime.UtcNow;
                beUpdatePokemon.UpdatedUserId = user.Id;

                // Will be update for update more properties of this Entity

                _repository.Update(beUpdatePokemon);
                await _unitOfWork.SaveChangesAsync();

                return ResponseCodeString.Action_Success;
            }
            catch (Exception ex)
            {
                throw new Exception(ResponseCodeString.ContentUpdate_Error, ex.InnerException);
            }
        }

        public async Task<string> DeletePokedex(NewPokedexDTO deletePokemon)
        {
            try
            {
                Pokedex beDeletePokemon = _repository.Find(deletePokemon.Id);
                _repository.Delete(beDeletePokemon);
                await _unitOfWork.SaveChangesAsync();
                return ResponseCodeString.Action_Success;
            }
            catch (Exception ex)
            {
                throw new Exception(ResponseCodeString.ContentDelete_Error, ex.InnerException);
            }
        }
    }
}
