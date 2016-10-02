using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acr.Settings;
using EWiki.XF.Models;
using EWiki.XF.Service.Models;

namespace EWiki.XF.Utilities
{
    public class LocalDataStorage
    {
        public static void SavePokemonAccounts(string username, List<PokemonAccount> accounts)
        {
            var data = Settings.Local.Get<List<PokemonAccountsData>>("PokemonAccountsData");
            if (data == null)
            {
                data = new List<PokemonAccountsData>
                {
                    new PokemonAccountsData {Username = username, Accounts = accounts}
                };
            }
            else
            {
                foreach (var item in data)
                {
                    if (item.Username == username)
                        item.Accounts = accounts;
                }
            }

            Settings.Local.Set("PokemonAccountsData", data);
        }

        public static List<PokemonAccount> GetPokemonAccounts(string username)
        {
            var data = Settings.Local.Get<List<PokemonAccountsData>>("PokemonAccountsData");
            if (data == null)
                return null;

            foreach (var item in data)
            {
                if (item.Username == username)
                    return item.Accounts;
            }

            return null;
        }

        public static void SaveActivePokemonAccount(PokemonAccount account)
        {
            Settings.Local.Set("ActivePokemonAccount", account);
        }

        public static PokemonAccount GetActivePokemonAccount()
        {
            var account = Settings.Local.Get<PokemonAccount>("ActivePokemonAccount");
            return account;
        }

        public static void SaveAuthData(AuthData authData)
        {
            Settings.Local.Set("AuthData", authData);
        }

        public static AuthData GetAuthData()
        {
            return Settings.Local.Get<AuthData>("AuthData");
        }

        class PokemonAccountsData
        {
            public string Username { get; set; }
            public List<PokemonAccount> Accounts { get; set; }
        }
    }
}
