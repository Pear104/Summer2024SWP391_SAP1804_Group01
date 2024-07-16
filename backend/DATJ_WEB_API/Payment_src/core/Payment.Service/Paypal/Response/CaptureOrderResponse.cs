using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Payment_src.core.Payment.Service.Paypal.Model;

namespace backend.Payment_src.core.Payment.Service.Paypal.Response
{
   public sealed class CaptureOrderResponse
	{
		public string id { get; set; }
		public string status { get; set; }
		public PaymentSource payment_source { get; set; }
		public List<PurchaseUnit> purchase_units { get; set; }
		public Payer payer { get; set; }
		public List<Link> links { get; set; }
	}
}