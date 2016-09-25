using EWiki.Api.Models;
using System;

namespace EWiki.Api
{
    public abstract class BaseDto
    {
        public int Id { get; set; }
        public string CreatedUserId { get; set; }
        public User CreatedUser { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UpdatedUserId { get; set; }
        public User UpdatedUser { get; set; }
        public DateTime? UpdatedDate { get; set; }
    }
}
