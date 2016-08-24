using AutoMapper;
using System.Linq;
using System.Security.Claims;
using EWiki.DataAccess.Models;
using EWiki.Entities.Models;

namespace EWiki.DataAccess.Mappers
{
    public class AutoMapperConfiguration
    {
        public static void Configure()
        {
            Mapper.Initialize(m =>
            {
                m.AddProfile<EFOToDTOMappingProfile>();
                m.AddProfile<DTOToEFOMappingProfile>();
            });
        }

        public class DTOToEFOMappingProfile : Profile
        {
            public DTOToEFOMappingProfile()
            {
                CreateMap<GetPokedexDTO, Pokedex>();
            }

            public override string ProfileName
            {
                get { return "DTOToEFOMappings"; }
            }
        }

        public class EFOToDTOMappingProfile : Profile
        {
            public EFOToDTOMappingProfile()
            {
                CreateMap<Pokedex, GetPokedexDTO>();
            }

            public override string ProfileName
            {
                get { return "EFOToDTOMappings"; }
            }
        }
    }
}