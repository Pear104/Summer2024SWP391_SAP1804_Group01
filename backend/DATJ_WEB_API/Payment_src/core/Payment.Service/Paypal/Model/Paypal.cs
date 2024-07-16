using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
    public sealed class Paypal
    {
        public Name name { get; set; }
        public string email_address { get; set; }
        public string account_id { get; set; }
    }
}