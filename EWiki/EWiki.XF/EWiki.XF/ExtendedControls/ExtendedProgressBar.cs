using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace EWiki.XF.ExtendedControls
{
    public class ExtendedProgressBar : ProgressBar
    {
        #region Bindable Properties

        public static BindableProperty ProgressColorProperty = BindableProperty.Create("ProgressColor",
            typeof(Color), typeof(ExtendedProgressBar), Color.FromHex("#FF4081"), BindingMode.TwoWay);

        #endregion

        #region Properties
        
        public Color ProgressColor
        {
            get { return (Color)GetValue(ProgressColorProperty); }
            set { SetValue(ProgressColorProperty, value); }
        }

        #endregion
    }
}
