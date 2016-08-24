using Microsoft.AspNet.Identity.EntityFramework;
using EWiki.DataAccess.Infrastructure;
using EWiki.DataAccess.Infrastructure.Identity;
using EWiki.DataAccess.Services.ServiceInterfaces;
using EWiki.Entities.Models;

namespace EWiki.DataAccess.Services
{
    public class PageService : Service<Page>, IPageService
    {
        private readonly IRepository<Page> _repository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly EWikiIdentityContext _ictx;
        private readonly EWikiUserManager _userManager;

        public PageService(IRepository<Page> repository, IUnitOfWork unitOfWork) : base(repository)
        {
            this._repository = repository;
            this._unitOfWork = unitOfWork;
            _ictx = new EWikiIdentityContext();
            _userManager = new EWikiUserManager(new UserStore<User>(_ictx));
        }
    }
}
