using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
   public sealed class PurchaseUnit
	{
		public Amount amount { get; set; }
		public string reference_id { get; set; }
		public Shipping shipping { get; set; }
		public Payments payments { get; set; }
	}

}