using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
   public sealed class SellerReceivableBreakdown
	{
		public Amount gross_amount { get; set; }
		public PaypalFee paypal_fee { get; set; }
		public Amount net_amount { get; set; }
	}
}