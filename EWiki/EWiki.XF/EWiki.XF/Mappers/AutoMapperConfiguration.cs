using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using EWiki.XF.Models;
using EWiki.XF.Service.Models;
using Xamarin.Forms;

namespace EWiki.XF.Mappers
{
    public class AutoMapperConfiguration
    {
        public static void Configure()
        {
            Mapper.Initialize(x =>
            {
                x.AddProfile<ServiceModelToModelMappingProfile>();
                x.AddProfile<ModelToServiceModelMappingProfile>();
            });
        }

        public class ServiceModelToModelMappingProfile : Profile
        {
            public override string ProfileName
            {
                get { return "ServiceModelToModelMappingProfile"; }
            }

            protected override void Configure()
            {
                CreateMap<PokemonSM, Pokemon>()
                    .ForMember(p => p.Types, o => o.MapFrom(
                        p => p.Types.Select(t => new TypeSM() {
                            CatTitle = $"http://res.cloudinary.com/ewiki-io/image/upload/c_scale,h_100/v1475135097/Pokemons/Types/vi/{t}.png"
                        })));
            }
        }

        public class ModelToServiceModelMappingProfile : Profile
        {
            public override string ProfileName
            {
                get { return "ModelToServiceModelMappingProfile"; }
            }

            protected override void Configure()
            {
                
            }
        }
    }
}
