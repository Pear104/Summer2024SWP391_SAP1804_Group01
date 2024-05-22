namespace backend.Crawler
{
    public class CrawlClasses
    {
        public class Diamond
        {
            public string diamond_name { get; set; }
            public string Appointment { get; set; }
            public string QuickShip { get; set; }
            public int bank_wire_price_in_currency { get; set; }
            public string cert_num { get; set; }
            public string cert_url { get; set; }
            public string city { get; set; }
            public string clarity { get; set; }
            public string color { get; set; }
            public string country { get; set; }
            public string culet_condition { get; set; }
            public string culet_size { get; set; }
            public string currency_code { get; set; }
            public string currency_symbol { get; set; }
            public string current_diamond_type { get; set; }
            public string cut { get; set; }
            public string depth_percent { get; set; }
            public string diamondQuantity { get; set; }
            public string diamond_feed { get; set; }
            public string diamond_id { get; set; }
            public string diamond_type { get; set; }
            public int discount_perc { get; set; }
            public string eye_clean { get; set; }
            public string fluor_color { get; set; }
            public string fluor_intensity { get; set; }
            public string girdle_condition { get; set; }
            public string girdle_max { get; set; }
            public string girdle_min { get; set; }
            public bool has_cert_file { get; set; }
            public bool has_image_file { get; set; }
            public bool has_sarineloupe { get; set; }
            public bool has_video_file { get; set; }
            public string image_file_url { get; set; }
            public string image_url { get; set; }
            public string inserted_on { get; set; }
            public string lab { get; set; }
            public double meas_depth { get; set; }
            public double meas_length { get; set; }
            public double meas_width { get; set; }
            public string measurements { get; set; }
            public string polish { get; set; }
            public string ratio { get; set; }
            public string retail_price { get; set; }
            public string sellerName { get; set; }
            public string shape { get; set; }
            public double size { get; set; }
            public string special_price { get; set; }
            public string state { get; set; }
            public string steps_image_url { get; set; }
            public string stock_num { get; set; }
            public string symmetry { get; set; }
            public string table_percent { get; set; }
            public int total_discounted_sales_price { get; set; }
            public string total_discounted_sales_price_in_currency { get; set; }
            public string total_discounted_sales_price_without_currency_symbol { get; set; }
            public int total_sales_price { get; set; }
            public string total_sales_price_in_currency { get; set; }
            public string total_sales_price_without_currency_symbol { get; set; }
            public string vaultDiscount { get; set; }
            public string video_file_url { get; set; }
            public string video_file_url_insecure { get; set; }
            public string video_url { get; set; }

            public override string ToString()
            {
                return $"name: {this.diamond_name}, lab: {this.lab}, cert_url: {this.cert_url}, image_url: {image_url} carat:{this.size}, cut: {this.cut}, clarity: {this.clarity}, color: {this.color}, polish: {this.polish}, symmetry: {this.symmetry} {this.fluor_intensity}";
            }
        }

        public class LiveDiamondData
        {
            public int originalCount { get; set; }
            public int dataCount { get; set; }
            public string diamondsReturned { get; set; }
            public string pageNo { get; set; }
            public List<Diamond> diamond { get; set; }
        }

        public class Data
        {
            public LiveDiamondData liveDiamondData { get; set; }
        }

        public class Root
        {
            public Data data { get; set; }
        }
    }
}
