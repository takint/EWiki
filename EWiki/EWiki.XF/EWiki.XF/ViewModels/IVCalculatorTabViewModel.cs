using System.Collections.ObjectModel;
using EWiki.XF.Models;

namespace EWiki.XF.ViewModels
{
    public class IVCalculatorTabViewModel : BaseViewModel
    {
        private int _cp;

        public int CP
        {
            get { return _cp; }
            set { SetProperty(ref _cp, value); }
        }

        private int _hp;

        public int HP
        {
            get { return _hp; }
            set { SetProperty(ref _hp, value); }
        }

        private int _stardust;

        public int Stardust
        {
            get { return _stardust; }
            set { SetProperty(ref _stardust, value); }
        }

        private bool _powered;

        public bool Powered
        {
            get { return _powered; }
            set { SetProperty(ref _powered, value); }
        }

        private ObservableCollection<string> _results = new ObservableCollection<string>() {"", "", "", "", ""};

        public ObservableCollection<string> Results
        {
            get { return _results; }
            set
            {
                _resultListHeight = _results.Count*200;
                SetProperty(ref _results, value);
            }
        }

        public int _resultListHeight;

        public int ResultListHeight
        {
            get { return _resultListHeight; }
            set { SetProperty(ref _resultListHeight, value); }
        }

        public IVCalculatorTabViewModel()
        {
        }
    }
}
