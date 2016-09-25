using System;
using System.Collections;
using System.Collections.Specialized;
using System.Linq;
using Xamarin.Forms;

namespace EWiki.XF.ExtendedControls
{
    public class CarouselViewIndicator : Grid
    {
        private readonly StackLayout _indicators = new StackLayout { Orientation = StackOrientation.Horizontal, HorizontalOptions = LayoutOptions.CenterAndExpand, Spacing = 0};

        #region Bindable properties

        public static readonly BindableProperty UseImageProperty = BindableProperty.Create(nameof(UseImage), typeof(bool), typeof(CarouselViewIndicator), false);
        public static readonly BindableProperty PositionProperty = BindableProperty.Create(nameof(Position), typeof(int), typeof(CarouselViewIndicator), 0, BindingMode.TwoWay, 
            propertyChanging: (bindable, oldvalue, newvalue) => ((CarouselViewIndicator)bindable).PositionChanging(oldvalue, newvalue));
        public static readonly BindableProperty ItemsSourceProperty = BindableProperty.Create(nameof(ItemsSource), typeof(IEnumerable), typeof(CarouselViewIndicator), null, 
            propertyChanged: (bindable, oldvalue, newvalue) => ((CarouselViewIndicator)bindable).OnItemsSourceChanged(oldvalue, newvalue));
        public static readonly BindableProperty SelectedIndicatorImageProperty = BindableProperty.Create(nameof(SelectedIndicatorImage), typeof(ImageSource), typeof(CarouselViewIndicator));
        public static readonly BindableProperty UnselectedIndicatorImageProperty = BindableProperty.Create(nameof(UnselectedIndicatorImage), typeof(ImageSource), typeof(CarouselViewIndicator));
        public static readonly BindableProperty IndicatorWidthProperty = BindableProperty.Create(nameof(IndicatorWidth), typeof(double), typeof(CarouselViewIndicator), 15.0);
        public static readonly BindableProperty IndicatorHeightProperty = BindableProperty.Create(nameof(IndicatorHeight), typeof(double), typeof(CarouselViewIndicator), 15.0);
        public static readonly BindableProperty IndicatorColorProperty = BindableProperty.Create(nameof(IndicatorColor), typeof(Color), typeof(CarouselViewIndicator), Color.Default);

        #endregion

        #region Properties

        public bool UseImage
        {
            get { return (bool)GetValue(UseImageProperty); }
            set { SetValue(UseImageProperty, value); }
        }

        public int Position
        {
            get { return (int)GetValue(PositionProperty); }
            set { SetValue(PositionProperty, value); }
        }

        public IEnumerable ItemsSource
        {
            get { return (IEnumerable)GetValue(ItemsSourceProperty); }
            set { SetValue(ItemsSourceProperty, value); }
        }

        public ImageSource SelectedIndicatorImage
        {
            get { return (ImageSource)GetValue(SelectedIndicatorImageProperty); }
            set { SetValue(SelectedIndicatorImageProperty, value); }
        }

        public ImageSource UnselectedIndicatorImage
        {
            get { return (ImageSource)GetValue(UnselectedIndicatorImageProperty); }
            set { SetValue(UnselectedIndicatorImageProperty, value); }
        }

        public double IndicatorWidth
        {
            get { return (double)GetValue(IndicatorWidthProperty); }
            set { SetValue(IndicatorWidthProperty, value); }
        }

        public double IndicatorHeight
        {
            get { return (double)GetValue(IndicatorHeightProperty); }
            set { SetValue(IndicatorHeightProperty, value); }
        }

        public Color IndicatorColor
        {
            get { return (Color)GetValue(IndicatorColorProperty); }
            set { SetValue(IndicatorColorProperty, value); }
        }

        #endregion

        public CarouselViewIndicator()
        {
            HorizontalOptions = LayoutOptions.CenterAndExpand;
            RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });
            Children.Add(_indicators);
        }

        private void Clear()
        {
            _indicators.Children.Clear();
        }

        private void Init(int position)
        {
            if (_indicators.Children.Count > 0)
            {
                for (int i = 0; i < _indicators.Children.Count; i++)
                {
                    if (_indicators.Children[i].ClassId == nameof(State.Selected) && i != position)
                        _indicators.Children[i] = BuildIndicator(State.Unselected, i);
                    else if (_indicators.Children[i].ClassId == nameof(State.Unselected) && i == position)
                        _indicators.Children[i] = BuildIndicator(State.Selected, i);
                }
            }
            else
            {
                var enumerator = ItemsSource.GetEnumerator();
                int count = 0;
                while (enumerator.MoveNext())
                {
                    var indicator = BuildIndicator(position == count ? State.Selected : State.Unselected, count);
                    _indicators.Children.Add(indicator);

                    count++;
                }
            }
        }

        private Image BuildImage(State state, int position)
        {
            var image = new Image
            {
                WidthRequest = IndicatorWidth,
                HeightRequest = IndicatorHeight,
                ClassId = state.ToString()
            };

            switch (state)
            {
                case State.Selected:
                    image.Source = SelectedIndicatorImage;
                    break;
                case State.Unselected:
                    image.Source = UnselectedIndicatorImage;
                    break;
                default:
                    throw new Exception("Invalid state selected");
            }

            image.GestureRecognizers.Add(new TapGestureRecognizer { Command = new Command(() => { Position = position; }) });

            return image;
        }

        private View BuildIndicator(State state, int position)
        {
            var indicatorCommand = new Command(() => { Position = position; });

            // Build indicator by image if UseImage
            if (UseImage)
            {
                var image = new Image
                {
                    WidthRequest = IndicatorWidth,
                    HeightRequest = IndicatorHeight,
                    ClassId = state.ToString()
                };

                switch (state)
                {
                    case State.Selected:
                        image.Source = SelectedIndicatorImage;
                        break;
                    case State.Unselected:
                        image.Source = UnselectedIndicatorImage;
                        break;
                    default:
                        throw new Exception("Invalid state selected");
                }

                image.GestureRecognizers.Add(new TapGestureRecognizer { Command = indicatorCommand });

                return image;
            }

            // Build indicator by button by default
            var button = new Button
            {
                BackgroundColor = IndicatorColor,
                WidthRequest = IndicatorWidth,
                HeightRequest = IndicatorHeight,
                ClassId = state.ToString(),
                Command = indicatorCommand
            };

            switch (state)
            {
                case State.Selected:
                    button.Opacity = 1;
                    break;
                case State.Unselected:
                    button.Opacity = 0.5;
                    break;
                default:
                    throw new Exception("Invalid state selected");
            }

            return button;
        }

        private void PositionChanging(object oldValue, object newValue)
        {
            Init(Convert.ToInt32(newValue));
        }

        private void OnItemsSourceChanged(object oldItems, object newItems)
        {
            if (oldItems != null)
            {
                var coll = (INotifyCollectionChanged)oldItems;
                coll.CollectionChanged -= Coll_CollectionChanged;
            }

            if (newItems != null)
            {
                var coll = (INotifyCollectionChanged)newItems;
                coll.CollectionChanged += Coll_CollectionChanged;
            }
        }

        private void Coll_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems == null)
                return;

            Clear();
            Init(0);
        }

        public enum State
        {
            Selected,
            Unselected
        }
    }
}
