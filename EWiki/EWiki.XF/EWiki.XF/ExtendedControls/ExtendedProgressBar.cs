using Xamarin.Forms;

namespace EWiki.XF.ExtendedControls
{
    public class ExtendedProgressBar : ProgressBar
    {
        #region Bindable Properties

        public static BindableProperty ProgressColorProperty = BindableProperty.Create("ProgressColor",
            typeof(Color), typeof(ExtendedProgressBar), Color.FromHex("#FF5252"), BindingMode.TwoWay);

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
