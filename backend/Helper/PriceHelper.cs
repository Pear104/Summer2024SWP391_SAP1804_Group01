using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Models;

namespace backend.Helper
{
    public static class PriceHelper
    {
        public static double GetDiamondPrice(float carat, double diamondPrice, float priceRate)
        {
            return carat * diamondPrice * 100 * priceRate;
        }

        public static double GetAccessoryPrice(
            float materialWeight,
            float size,
            double materialPrice,
            double processingPrice,
            float priceRate
        )
        {
            return (materialWeight + (size - 3) * materialPrice + processingPrice) * priceRate;
        }
    }
}