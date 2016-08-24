using System.Collections.Generic;

namespace EWiki.Entities.Models
{
    public class Site : EntityBase
    {
        /// <summary>
        /// Example: enwiki or viwiki
        /// </summary>
        public string SiteKey { get; set; }
        public string SiteType { get; set; }
        public string SiteGroup { get; set; }
        public string SiteSource { get; set; }
        /// <summary>
        /// Language code
        /// </summary>
        public string SiteLanguage { get; set; }
        public string SiteProtocol { get; set; }
        /// <summary>
        /// Example: Pokemon.viwiki.com
        /// </summary>
        public string SiteDomain { get; set; }
        public string SiteConfig { get; set; }
    }
}
