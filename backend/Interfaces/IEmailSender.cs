namespace backend.Interfaces
{
    public interface IEmailSender
    {
        public bool SendEmail(string toEmail, string name, string body, string subject);
    }
}
