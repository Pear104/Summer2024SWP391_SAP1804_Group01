using System.Net;
using System.Net.Mail;
using backend.Interfaces;

namespace backend.Service
{
    public class EmailSender : IEmailSender
    {
        public bool SendEmail(string toEmail, string name, string body, string subject)
        {
            try
            {
                var message = new MailMessage()
                {
                    From = new MailAddress("datj.company@gmail.com"),
                    Subject = subject,
                    IsBodyHtml = true,
                    Body =
                        $"Hello {name}, click in the link to verify your account: <a href='http://localhost:3000/authentication/verify-email?token={body}'></a>",
                };
                message.To.Add(toEmail);
                var smtp = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential(
                        "datj.company@gmail.com",
                        "qdfh hxaz rkcp yrwh"
                    ),
                    EnableSsl = true,
                };

                smtp.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return false;
            }
        }
    }
}
