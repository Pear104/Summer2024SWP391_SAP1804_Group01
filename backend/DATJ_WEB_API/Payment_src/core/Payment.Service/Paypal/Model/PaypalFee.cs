using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
   public sealed class PaypalFee
	{
		public string currency_code { get; set; }
		public string value { get; set; }
	}
}