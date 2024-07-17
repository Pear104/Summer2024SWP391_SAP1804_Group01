using System.Net;

namespace Helpers.Extensions
{
    public static class ObjectExtention
    {
        public static string ToQueryString(this object obj)
        {
            var properties =
                from p in obj.GetType().GetProperties()
                where p.GetValue(obj, null) != null
                select p.Name + "=" + WebUtility.UrlEncode(p.GetValue(obj, null)?.ToString());
            string queryString = string.Join("&", properties.ToArray());
            return queryString;
        }

        public static string PostFixPlusDateTimeNow(string postFix)
        {
            string result = postFix + DateTime.Now.Ticks.ToString(); //No special reason for this format, can be changed.
            return result;
        }

        public static long LongDateTimeNow()
        {
            long originalNumber = DateTime.Now.Ticks;
            return originalNumber;
        }
    }
}
