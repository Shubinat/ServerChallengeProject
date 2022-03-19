using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Design.Classes
{
    public class SearchRequest
    {
        public string RequestText { get; set; }
        public SearchRequest(string text)
        {
            RequestText = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(text);
        }
    }
}
