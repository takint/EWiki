using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.XF.Service.Models
{
    public class AuthData
    {
        public string AccessToken { get; set; }
        public DateTime ExpiresIn { get; set; }
        public string Username { get; set; }
        public string UserId { get; set; }
        public string Email { get; set; }
    }
}
