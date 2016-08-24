using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WikiApp.Entities.Models
{
    public class Location : EntityBase
    {

        public string Name { get; set; }

        public string Description { get; set; }

        public Type[] Types { get; set; }
    }
}
