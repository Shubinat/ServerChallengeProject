using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Design.UserControls
{
    /// <summary>
    /// Interaction logic for SearchTab.xaml
    /// </summary>
    public partial class SearchTab : UserControl
    {
        public event EventHandler CloseButtonClicked;
        private TabItem _tabItem;
        public SearchTab(TabItem tabItem)
        {
            InitializeComponent();
            _tabItem = tabItem;
        }

        private void BtnCloseTab_Click(object sender, RoutedEventArgs e)
        {
            CloseButtonClicked?.Invoke(_tabItem, e);
        }
    }
}
