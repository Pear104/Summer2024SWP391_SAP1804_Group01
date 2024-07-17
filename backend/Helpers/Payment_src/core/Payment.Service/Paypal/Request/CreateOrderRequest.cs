using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using backend.Payment_src.core.Payment.Service.Paypal;
using backend.Payment_src.core.Payment.Service.Paypal.Model;

namespace backend.Payment_src.core.Payment.Service.Paypal.Request
{
    public sealed class CreateOrderRequest
	{
		public string intent { get; set; }
		public List<PurchaseUnit> purchase_units { get; set; } = new();
	}

}