using EWiki.DataAccess.Services;
using EWiki.DataAccess.Services.ServiceInterfaces;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace EWikiApi.Controllers
{
    public class HomeController : Controller
    {
        private readonly IPokedexService _pokedexService;

        public HomeController(IPokedexService pokedexService)
        {
            _pokedexService = pokedexService;
        }

        public ActionResult Index(string attr1, string attr2, string attr3, string attr4)
        {
            ViewBag.SiteName = ConfigurationManager.AppSettings["SiteName"];
            ViewBag.SiteTitle = ConfigurationManager.AppSettings["SiteTitle"];
            ViewBag.AbsoluteUri = Request.Url.AbsoluteUri;
            return View();
        }
    }
}
