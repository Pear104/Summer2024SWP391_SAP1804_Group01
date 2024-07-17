using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Helpers.DTOs.Account;

namespace Helpers.DTOs.PriceRate
{
    public class PriceRateDTO
    {
        public long PriceRateId { get; set; }
        public long AccountId { get; set; }
        public AccountDTO? Account { get; set; } // Nguoi sua ti le ap gia
        public float Percent { get; set; } // Tien le apgia
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
