using AutoMapper;
using System.Linq;
using System.Security.Claims;
using WikiApp.DataAccess.Models;
using WikiApp.Entities.Models;

namespace WikiApp.DataAccess.Mappers
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
            public override string ProfileName
            {
                get { return "DTOToEFOMappings"; }
            }

            protected override void Configure()
            {
            }
        }

        public class EFOToDTOMappingProfile : Profile
        {
            public override string ProfileName
            {
                get { return "EFOToDTOMappings"; }
            }

            protected override void Configure()
            {
            }
        }
    }
}