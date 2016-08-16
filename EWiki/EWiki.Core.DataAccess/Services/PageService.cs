using Microsoft.AspNet.Identity.EntityFramework;
using WikiApp.DataAccess.Infrastructure;
using WikiApp.DataAccess.Infrastructure.Identity;
using WikiApp.DataAccess.Services.ServiceInterfaces;
using WikiApp.Entities.Models;

namespace WikiApp.DataAccess.Services
{
    public class PageService : Service<Page>, IPageService
    {
        private readonly IRepository<Page> _repository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly WikiAppIdentityContext _ictx;
        private readonly WikiAppUserManager _userManager;

        public PageService(IRepository<Page> repository, IUnitOfWork unitOfWork) : base(repository)
        {
            this._repository = repository;
            this._unitOfWork = unitOfWork;
            _ictx = new WikiAppIdentityContext();
            _userManager = new WikiAppUserManager(new UserStore<User>(_ictx));
        }
    }
}
