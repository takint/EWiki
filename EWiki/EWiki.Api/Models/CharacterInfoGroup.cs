﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EWiki.Api.Models
{
    public class CharacterInfoGroup : EntityBase
    {
        public string Name { get; set; }
        public int Priority { get; set; }
        public virtual ICollection<CharacterInfo> CharacterInfos { get; set; }
    }
}
