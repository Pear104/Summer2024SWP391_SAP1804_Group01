namespace backend.Payment_src.core.Payment.Application.Base.Models
{
    public class BaseResultWIthData<T> : BaseResult
    {
        public T? Data { get; set; }
    }
}
