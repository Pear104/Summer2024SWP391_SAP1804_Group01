using Microsoft.AspNetCore.Mvc;

namespace backend.Payment_src.core.Payment.Application.Base.Models
{
    [BindProperties]
    public class BasePagingQuery
    {
        public string? Criteria { get; set; } = string.Empty;
        public int? PageSize { get; set; } = 20;
        public int? PageIndex { get; set; } = 20;

    }
}
