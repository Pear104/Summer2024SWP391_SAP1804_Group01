using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
    public class Address
	{
		public string address_line_1 { get; set; }
		public string address_line_2 { get; set; }
		public string admin_area_2 { get; set; }
		public string admin_area_1 { get; set; }
		public string postal_code { get; set; }
		public string country_code { get; set; }
	}
}