namespace backend.Payment_src.core.Payment.Application.Base.Models
{
    public class BaseResultWithData<T> : BaseResult
    {
        public T? Data { get; set; }
    }
}
