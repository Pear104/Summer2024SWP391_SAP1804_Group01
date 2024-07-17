using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Helpers.HelperClasses
{
    public class HtmlParser
    {
        public static string ExtractFirstImageFromHtml(string text)
        {
            MatchCollection matches = Regex.Matches(
                text,
                "]* src=\"([^\"]*)?\"[^>]*>",
                RegexOptions.IgnoreCase
            );
            string src = "";
            if (matches.Count > 0)
            {
                src = matches[0].Groups[1].Value;
            }
            return src;
        }
    }
}
