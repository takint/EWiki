using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using EWiki.Api.DataAccess;
using Microsoft.EntityFrameworkCore;
using EWiki.Api.Models;
using Microsoft.AspNetCore.Builder;
using System;

namespace EWiki.Api
{
    public class Startup
    {
        public Startup(IHostingEnvironment env)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(env.ContentRootPath)
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
                .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
                .AddEnvironmentVariables();
            Configuration = builder.Build();
        }

        public IConfigurationRoot Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            // Add framework services.
            services.AddEntityFrameworkSqlServer()
                .AddDbContext<EWikiContext>(options =>
                options.UseSqlServer(Configuration["Data:DefaultConnection:ConnectionString"]));

            services.AddIdentity<User, IdentityRole>()
                .AddEntityFrameworkStores<EWikiContext>()
                .AddDefaultTokenProviders();

            services.AddMvc();

            // Add application services.
            services.AddSingleton<IDbFactory, DbFactory>();
            services.AddSingleton<IPokedexRepository, PokedexRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            if (env.IsDevelopment())
            {
                app.UseBrowserLink();
                app.UseDeveloperExceptionPage();
                app.UseDatabaseErrorPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");

                // For more details on creating database during deployment see http://go.microsoft.com/fwlink/?LinkID=615859
                try
                {
                    using (var serviceScope = app.ApplicationServices.GetRequiredService<IServiceScopeFactory>()
                        .CreateScope())
                    {
                        serviceScope.ServiceProvider.GetService<EWikiContext>()
                             .Database.Migrate();
                    }
                }
                catch(Exception ex)
                {
                    throw new Exception(ex.Message);
                }
            }

            app.UseDefaultFiles();

            app.UseStaticFiles();

            app.UseIdentity();

            app.UseMvc();
        }
    }
}
