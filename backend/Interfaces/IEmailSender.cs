﻿using backend.Models;

namespace backend.Interfaces
{
    public interface IEmailSender
    {
        public bool SendVerifyEmail(string toEmail, string name, string token, string subject);
        public bool SendResetEmail(string toEmail, string name, string token, string subject);
        public bool SendOrderEmail(Order order, string emailType);
    }
}
