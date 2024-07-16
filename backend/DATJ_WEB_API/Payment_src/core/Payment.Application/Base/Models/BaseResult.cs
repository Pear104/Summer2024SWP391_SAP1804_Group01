namespace backend.Payment_src.core.Payment.Application.Base.Models
{
    public class BaseResult
    {
        public bool Success { get; set; }
        public string? Message{ get; set; }
        public List<BaseError> Errors { get; set; } = new List<BaseError>();
    }
}
