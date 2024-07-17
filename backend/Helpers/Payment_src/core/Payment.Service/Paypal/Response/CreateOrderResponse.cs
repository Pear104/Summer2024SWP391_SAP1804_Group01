using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Payment_src.core.Payment.Service.Paypal.Model;

namespace backend.Payment_src.core.Payment.Service.Paypal.Response
{
   public sealed class CreateOrderResponse
	{
		public string id { get; set; }
		public string status { get; set; }
		public List<Link> links { get; set; }
	}
}