using System.Net;

namespace backend.Helper
{
    public static class ObjectExtention
    {
        public static string ToQueryString(this object obj)
        {
            var properties = from p in obj.GetType().GetProperties()
                             where p.GetValue(obj, null) != null
                             select p.Name + "=" + WebUtility.UrlEncode(p.GetValue(obj, null)?.ToString());
            string queryString = string.Join("&", properties.ToArray());
            return queryString;
        }

        public static string PostFixPlusDateTimeNow(string postFix)
        {
            string result = postFix + DateTime.Now.Ticks.ToString();   //No special reason for this format, can be changed.
            return result;
        }

        public static long LongDateTimeNow()
        {
            //remove the first 4 number to avoid frontend rouding.
            long originalNumber = DateTime.Now.Ticks / 1000;
            // Remove the last two digits by dividing by 100
            originalNumber /= 100;

            // Remove the first two digits
            long result = originalNumber % 100000000000000;
            return result;
        }
    }
}
