using System.Collections.Generic;
using EWiki.XF.Droid.Utils.IconizeModules.Collections;
using Plugin.Iconize;

namespace EWiki.XF.Droid.Utils.IconizeModules
{
    public sealed class LinearModule : IconModule
    {
        public LinearModule() : base("Linear Icons", "LinearIcons-Regular", "Fonts/LinearIcons-Regular.ttf", (IEnumerable<IIcon>)LinearCollection.Icons)
        {
        }
    }
}