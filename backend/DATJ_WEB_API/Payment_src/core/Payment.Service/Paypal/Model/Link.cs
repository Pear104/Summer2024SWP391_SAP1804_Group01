using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
    public sealed class Link
	{
		public string href { get; set; }
		public string rel { get; set; }
		public string method { get; set; }
	}
}