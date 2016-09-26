using System;
using System.Windows.Input;
using Xamarin.Forms;

namespace EWiki.XF.Behaviors
{
    public class ListViewBehavior : Behavior<ListView>
    {
        public static readonly BindableProperty CommandProperty =
            BindableProperty.Create("Command", typeof(ICommand), typeof(ListViewBehavior), null);

        public static readonly BindableProperty ItemTapCommandProperty =
            BindableProperty.Create("ItemTapCommand", typeof(ICommand), typeof(ListViewBehavior), null);

        public static readonly BindableProperty InputConverterProperty =
            BindableProperty.Create("Converter", typeof(IValueConverter), typeof(ListViewBehavior), null);

        public static readonly BindableProperty AllowSelectItemProperty =
            BindableProperty.Create("AllowSelectItem", typeof(bool), typeof(ListViewBehavior), true);

        public ListView AssociatedObject { get; private set; }

        public ICommand Command
        {
            get { return (ICommand)GetValue(CommandProperty); }
            set { SetValue(CommandProperty, value); }
        }

        public ICommand ItemTapCommand
        {
            get { return (ICommand)GetValue(ItemTapCommandProperty); }
            set { SetValue(ItemTapCommandProperty, value); }
        }

        public IValueConverter Converter
        {
            get { return (IValueConverter)GetValue(InputConverterProperty); }
            set { SetValue(InputConverterProperty, value); }
        }

        public bool AllowSelectItem
        {
            get { return (bool)GetValue(AllowSelectItemProperty); }
            set { SetValue(AllowSelectItemProperty, value); }
        }

        protected override void OnAttachedTo(ListView bindable)
        {
            base.OnAttachedTo(bindable);

            AssociatedObject = bindable;
            bindable.BindingContextChanged += OnBindingContextChanged;
            bindable.ItemAppearing += OnItemAppearing;
            bindable.ItemTapped += OnItemTapped;
        }

        protected override void OnDetachingFrom(ListView bindable)
        {
            base.OnDetachingFrom(bindable);

            bindable.BindingContextChanged -= OnBindingContextChanged;
            bindable.ItemAppearing -= OnItemAppearing;
            bindable.ItemTapped -= OnItemTapped;
            AssociatedObject = null;
        }

        protected void OnBindingContextChanged(object sender, EventArgs e)
        {
            OnBindingContextChanged();
        }

        private void OnItemAppearing(object sender, ItemVisibilityEventArgs e)
        {
            var lv = ((ListView)sender);
            if (lv.IsRefreshing)
                return;

            if (Command == null)
            {
                return;
            }

            object parameter = Converter.Convert(e, typeof(object), null, null);
            if (Command.CanExecute(parameter))
            {
                Command.Execute(parameter);
            }

        }

        private void OnItemTapped(object sender, ItemTappedEventArgs e)
        {
            var lv = ((ListView)sender);

            if (ItemTapCommand.CanExecute(e.Item))
            {
                ItemTapCommand.Execute(e.Item);
            }

            if (!AllowSelectItem)
            {
                lv.SelectedItem = null;
            }
        }

        protected override void OnBindingContextChanged()
        {
            base.OnBindingContextChanged();
            BindingContext = AssociatedObject.BindingContext;
        }

    }
}
