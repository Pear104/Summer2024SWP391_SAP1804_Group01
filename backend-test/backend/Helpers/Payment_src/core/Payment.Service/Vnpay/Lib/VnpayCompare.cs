using System.Globalization;

namespace backend.Payment_src.core.Payment.Service.Vnpay.Lib
{
    public class VnpayCompare : IComparer<string>
    {
        //Dat fix null 25/06
        public int Compare(string? x, string? y)
        {
            if (x == y) return 0;
            if (x == null) return -1;
            if (y == null) return 1;
            var vnpCompare = CompareInfo.GetCompareInfo("en-US");
            return vnpCompare.Compare(x, y, CompareOptions.Ordinal);
        }
    }
}
