using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace EWiki.XF.Utilities
{
    class ResourceHelper
    {
        private static readonly ResourceManager _resManager;

        static ResourceHelper()
        {
            _resManager = new ResourceManager("EWiki.XF.Resources.Resource", typeof(ResourceHelper).GetTypeInfo().Assembly);
        }

        /// <summary>
        /// Gets string resource
        /// </summary>
        /// <param name="resourceName"></param>
        /// <returns></returns>
        public static string GetString(string resourceName)
        {
            var result = _resManager.GetString(resourceName, App.CurrentCulture);
            return result;
        }
    }
}
