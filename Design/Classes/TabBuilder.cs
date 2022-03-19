using Design.UserControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Design.Classes
{
    public class TabBuilder
    {
        public static TabItem CreateTab(string header, List<Supplier> content, EventHandler handler)
        {
            var tab = new TabItem();
            var tabHeader = new SearchTab(tab)
            {
                DataContext = new SearchRequest(header)

            };
            tabHeader.CloseButtonClicked += handler;
            tab.Header = tabHeader;
            var tabContent = new SearchResponse(content);
            tab.Content = tabContent;
            return tab;
        }
    }
}
