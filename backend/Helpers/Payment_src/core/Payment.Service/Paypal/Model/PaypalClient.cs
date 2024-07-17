using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using backend.Payment_src.core.Payment.Service.Paypal.Model;
using backend.Payment_src.core.Payment.Service.Paypal.Request;
using backend.Payment_src.core.Payment.Service.Paypal.Response;

namespace backend.Payment_src.core.Payment.Service.Paypal.Model
{
	public sealed class PaypalClient
	{
		public string Mode { get; }
		public string ClientId { get; }
		public string ClientSecret { get; }

		public string BaseUrl => Mode == "Live"
			? "https://api-m.paypal.com"
			: "https://api-m.sandbox.paypal.com";

		public PaypalClient(string mode, string clientId, string clientSecret)
		{
			Mode = mode;
			ClientId = clientId;
			ClientSecret = clientSecret;
		}

		private async Task<AuthResponse> Authenticate()
		{
			var auth = Convert.ToBase64String(Encoding.UTF8.GetBytes($"{ClientId}:{ClientSecret}"));
			Console.WriteLine("Client id: " + ClientId);
			Console.WriteLine("Client secret: " + ClientSecret);
			Console.WriteLine("Authenticated" + auth);
			var content = new List<KeyValuePair<string, string>>
			{
				new("grant_type", "client_credentials")
			};

			var request = new HttpRequestMessage
			{
				RequestUri = new Uri($"{BaseUrl}/v1/oauth2/token"),
				Method = HttpMethod.Post,
				Headers =
				{
					{ "Authorization", $"Basic {auth}" }
				},
				Content = new FormUrlEncodedContent(content)
			};

			var httpClient = new HttpClient();
			var httpResponse = await httpClient.SendAsync(request);
			var jsonResponse = await httpResponse.Content.ReadAsStringAsync();
			var response = JsonSerializer.Deserialize<AuthResponse>(jsonResponse);

			return response;
		}

		public async Task<CreateOrderResponse> CreateOrder(string value, string currency, string reference)
		{
			var auth = await Authenticate();
			Console.WriteLine("Authenticated" + auth.access_token);
			var request = new CreateOrderRequest
			{
				intent = "CAPTURE",
				purchase_units = new List<PurchaseUnit>
				{
					new()
					{
						reference_id = reference,
						amount = new Amount
						{
							currency_code = currency,
							value = value	
						}
					}
				}
			};

			var httpClient = new HttpClient();
			Console.WriteLine("Chuan bi gui request");
			httpClient.DefaultRequestHeaders.Authorization = AuthenticationHeaderValue.Parse($"Bearer {auth.access_token}");
			Console.WriteLine(httpClient.DefaultRequestHeaders.Authorization);
			var httpResponse = await httpClient.PostAsJsonAsync($"{BaseUrl}/v2/checkout/orders", request);
			Console.WriteLine(httpResponse);
			var jsonResponse = await httpResponse.Content.ReadAsStringAsync();
			Console.WriteLine(jsonResponse);
			var response = JsonSerializer.Deserialize<CreateOrderResponse>(jsonResponse);
			Console.WriteLine(response);
			if (response == null)
			{
				throw new InvalidOperationException("Failed to create order: response is null.");
			}

			return response;
		}

		public async Task<CaptureOrderResponse> CaptureOrder(string orderId)
		{
			var auth = await Authenticate();

			var httpClient = new HttpClient();

			httpClient.DefaultRequestHeaders.Authorization = AuthenticationHeaderValue.Parse($"Bearer {auth.access_token}");

			var httpContent = new StringContent("", Encoding.Default, "application/json");

			Console.WriteLine("Chuan bi gui request capture");
			var httpResponse = await httpClient.PostAsync($"{BaseUrl}/v2/checkout/orders/{orderId}/capture", httpContent);

			var jsonResponse = await httpResponse.Content.ReadAsStringAsync();
			var response = JsonSerializer.Deserialize<CaptureOrderResponse>(jsonResponse);
			if (response == null)
			{
				throw new InvalidOperationException("Failed to create order: response is null.");
			}

			Console.WriteLine("Ahihi:"+ response);
			return response;
		}
	}




}