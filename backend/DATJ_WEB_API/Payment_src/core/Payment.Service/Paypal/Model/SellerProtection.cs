using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
    public sealed class SellerProtection
	{
		public string status { get; set; }
		public List<string> dispute_categories { get; set; }
	}
}