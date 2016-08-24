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
            public override string ProfileName
            {
                get { return "DTOToEFOMappings"; }
            }

#pragma warning disable CS0672 // Member overrides obsolete member
            protected override void Configure()
#pragma warning restore CS0672 // Member overrides obsolete member
            {
                CreateMap<CreateUserDTO, User>();
            }
        }

        public class EFOToDTOMappingProfile : Profile
        {
            public override string ProfileName
            {
                get { return "EFOToDTOMappings"; }
            }

#pragma warning disable CS0672 // Member overrides obsolete member
            protected override void Configure()
#pragma warning restore CS0672 // Member overrides obsolete member
            {
                CreateMap<User, CreateUserDTO >();
            }
        }
    }
}