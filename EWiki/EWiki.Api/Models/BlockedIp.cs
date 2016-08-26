using System.Collections.Generic;

namespace EWiki.Api.Models
{
    public class BlockedIp : EntityBase
    {
        public string IpAddress { get; set; }
        public string BlockReason { get; set; }
        /// <summary>
        /// Block an user edit their content
        /// </summary>
        public bool BlockUserEdit { get; set; }
        /// <summary>
        /// If true only applied to block unauthorised user
        /// </summary>
        public bool AnonymousOnly { get; set; }
        /// <summary>
        /// If true prevent user from blocked ip create an account
        /// </summary>
        public bool BlockCreateAccount { get; set; }
        /// <summary>
        /// Time of the block
        /// </summary>
        public decimal BlockExpiry { get; set; }
        /// <summary>
        /// Use for block range of IP address
        /// </summary>
        public string IpRangeStart { get; set; }
        public string IpRangeEnd { get; set; }
        public int? ParentBlock { get; set; }

        public virtual ICollection<BlockedIp> ParentIpBlock { get; set; }
        public virtual User UserBlocked { get; set; }
        public virtual User BlockByUser { get; set; }
    }
}
