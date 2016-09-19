using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;

namespace EWiki.XF.ExtendedControls
{
    public partial class ExtendedCarouselView : ContentView
    {
        #region Bindable properties

        public static readonly BindableProperty ItemTemplateProperty =
            BindableProperty.Create(nameof(ItemTemplate), typeof(DataTemplate), typeof(ExtendedCarouselView));

        public static readonly BindableProperty ItemsSourceProperty =
            BindableProperty.Create(nameof(ItemsSource), typeof(IList), typeof(ExtendedCarouselView), null,
                                        propertyChanged: (bindable, oldvalue, newvalue) => ((ExtendedCarouselView)bindable).OnItemsSourceChanged(oldvalue as IList, newvalue as IList));

        public static BindableProperty IndicatorColorProperty =
            BindableProperty.Create(nameof(IndicatorColor), typeof(Color), typeof(ExtendedCarouselView), Color.Default);

        public static BindableProperty SelectedItemProperty =
            BindableProperty.Create(nameof(SelectedItem), typeof(object), typeof(ExtendedCarouselView), null, BindingMode.TwoWay);

        public static BindableProperty PositionProperty =
            BindableProperty.Create(nameof(Position), typeof(int), typeof(ExtendedCarouselView), 0, BindingMode.TwoWay,
                                        propertyChanged: (bindable, oldValue, newValue) => ((ExtendedCarouselView)bindable).PositionChanged());

        #endregion

        #region Properties

        public DataTemplate ItemTemplate
        {
            get { return (DataTemplate)GetValue(ItemTemplateProperty); }
            set { SetValue(ItemTemplateProperty, value); }
        }

        public IList ItemsSource
        {
            get { return (IList)GetValue(ItemsSourceProperty); }
            set { SetValue(ItemsSourceProperty, value); }
        }

        public Color IndicatorColor
        {
            get { return (Color)GetValue(IndicatorColorProperty); }
            set { SetValue(IndicatorColorProperty, value); }
        }

        public object SelectedItem
        {
            get { return GetValue(SelectedItemProperty); }
            set { SetValue(SelectedItemProperty, value); }
        }

        public int Position
        {
            get { return (int)GetValue(PositionProperty); }
            set { SetValue(PositionProperty, value); }
        }

        #endregion

        public ExtendedCarouselView()
        {
            InitializeComponent();

            MainContent.BindingContext = this;
        }

        private void OnItemsSourceChanged(IList oldItems, IList newItems)
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

            RefreshIndicator();
        }

        private void PositionChanged()
        {
            var indicatorItems = StackIndicator.Children.Cast<Button>().ToList();

            foreach (var item in indicatorItems)
            {
                UnselectItem(item);
            }

            if (Position > -1)
            {
                SelectItem(indicatorItems[Position]);
            }
        }

        private void RefreshIndicator()
        {
            const int dotSize = 15;

            StackIndicator.Children.Clear();
            for (var i = 0; i < ItemsSource.Count; i++)
            {
                var dot = new Button
                {
                    BorderRadius = Convert.ToInt32(dotSize / 2),
                    HeightRequest = dotSize,
                    WidthRequest = dotSize,
                    BackgroundColor = IndicatorColor
                };

                StackIndicator.Children.Add(dot);
            }

            PositionChanged();
        }

        private void UnselectItem(Button dot)
        {
            dot.Opacity = 0.5;
        }

        private void SelectItem(Button dot)
        {
            dot.Opacity = 1.0;
        }
    }
}
