﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
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
                var language = CultureInfo.CurrentCulture.Name.Split('-')[0] == "vi" ? "vi" : "en";
                CreateMap<PokemonSM, Pokemon>()
                    .ForMember(p => p.Types, o => o.MapFrom(
                        p => p.Types.Select(t => new TypeSM()
                        {
                            CatTitle =
                                $"http://res.cloudinary.com/ewiki-io/image/upload/c_scale,h_100/v1475135097/Pokemons/Types/{language}/{t}.png"
                        })))
                    .ForMember(p => p.Locations, o => o.MapFrom(p => MapLocations(p.Locations)));
            }

            private string MapLocations(ObservableCollection<LocationSM> locations)
            {
                var result = new List<string>();
                foreach (var location in locations)
                {
                    foreach (var s in location.Name.Split(','))
                    {
                        var strim = s.Trim();
                        if (!result.Contains(strim))
                        {
                            result.Add(strim);
                        }
                    }
                }
                return string.Join(", ", result);
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
