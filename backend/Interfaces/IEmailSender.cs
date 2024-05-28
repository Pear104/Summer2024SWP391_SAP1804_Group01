namespace backend.Interfaces
{
    public interface IEmailSender
    {
        public bool SendVerifyEmail(string toEmail, string name, string body, string subject);
        public bool SendResetEmail(string toEmail, string name, string body, string subject);
    }
}
