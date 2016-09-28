using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EWiki.XF.Service.Models;
using EWiki.XF.Service.Requests.Account;

namespace EWiki.XF.Service
{
    public interface IAccountService
    {
        Task RegisterAsync(string username, string email, string password);
        Task<AuthData> LoginAsync(string username, string password);
    }

    public class AccountService : IAccountService
    {
        public async Task RegisterAsync(string username, string email, string password)
        {
            var rq = new RegisterRq
            {
                UserName = username,
                Email = email,
                Password = password
            };

            await WebApiClient.Instance.PostAsync("account/register", rq);
        }

        public async Task<AuthData> LoginAsync(string username, string password)
        {
            var param = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("username", username),
                new KeyValuePair<string, string>("password", password)
            };

            var result = await WebApiClient.Instance.PostReturnValueAsync<AuthData>("token", param);
            return result;
        }
    }
}
