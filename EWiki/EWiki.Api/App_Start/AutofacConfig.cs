using Autofac;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using System.Linq;
using System.Reflection;
using System.Web.Http;
using System.Web.Mvc;
using EWiki.DataAccess;
using EWiki.DataAccess.Infrastructure;
using EWiki.DataAccess.Repositories;
using EWiki.DataAccess.Services;
using EWiki.Entities.Models;

namespace EWiki.Api
{
    public static class AutofacConfig
    {
        public static void Configure()
        {
            ContainerBuilder builder = new ContainerBuilder();
            builder.RegisterControllers(Assembly.GetExecutingAssembly());
            builder.RegisterApiControllers(Assembly.GetExecutingAssembly());
            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>().InstancePerRequest();
            builder.RegisterType<EWikiContext>().As<IDataContext>().InstancePerRequest();
            builder.RegisterType<RepositoryBase<Pokedex>>().As<IRepository<Pokedex>>().InstancePerRequest();
            builder.RegisterType<RepositoryBase<Category>>().As<IRepository<Category>>().InstancePerRequest();
            builder.RegisterType<RepositoryBase<Move>>().As<IRepository<Move>>().InstancePerRequest();
            builder.RegisterType<RepositoryBase<Location>>().As<IRepository<Location>>().InstancePerRequest();
            builder.RegisterType<RepositoryBase<Tag>>().As<IRepository<Tag>>().InstancePerRequest();

            // Repositories
            builder.RegisterAssemblyTypes(typeof(PokedexRepository).Assembly)
                .Where(t => t.Name.EndsWith("Repository"))
                .AsImplementedInterfaces().InstancePerRequest();
            // Services
            builder.RegisterAssemblyTypes(typeof(PokedexService).Assembly)
               .Where(t => t.Name.EndsWith("Service"))
               .AsImplementedInterfaces().InstancePerRequest();

            IContainer container = builder.Build();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
            GlobalConfiguration.Configuration.DependencyResolver = new AutofacWebApiDependencyResolver(container);
        }
    }
}