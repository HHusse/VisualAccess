using System;
using System.Net;
using System.Net.Mail;
using log4net;

namespace VisualAccess.Utils
{
    public static class MailSender
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(MailSender));
        private static string SmtpServer { get; set; }
        private static int SmtpPort { get; set; }
        private static string SmtpUser { get; set; }
        private static string SmtpPassword { get; set; }

        static MailSender()
        {
            SmtpServer = Environment.GetEnvironmentVariable("VSAC_SMTP_SERVER")!.ToString()!;
            SmtpPort = Convert.ToInt32(Environment.GetEnvironmentVariable("VSAC_SMTP_PORT")!.ToString()!);
            SmtpUser = Environment.GetEnvironmentVariable("VSAC_SMTP_USER")!.ToString()!;
            SmtpPassword = Environment.GetEnvironmentVariable("VSAC_SMTP_PASS")!.ToString()!;
        }

        public static bool WelcomeMessage(string toAddress, string username, string password)
        {
            string subject = "Welcome to VisualAccess - Your Account Information";
            string body =
                "Welcome to VisualAccess! We're thrilled to have you join our community. " +
                "Below, you'll find your account login details and some important information to get you started.\n\n" +
                $"Username: {username}\nPassword: {password}\n\n" +
                "For security reasons, we recommend that you log in to your account as soon as possible and change your password to something only you know. You can change your password by going to your account settings after you log in.";

            using (SmtpClient client = new SmtpClient(SmtpServer, SmtpPort) { EnableSsl = true })
            {
                client.Credentials = new NetworkCredential(SmtpUser, SmtpPassword);

                MailAddress fromAddress = new MailAddress(SmtpUser, "VisualAccess Team");
                MailMessage mailMessage = new MailMessage()
                {
                    From = fromAddress,
                    Subject = subject,
                    Body = body
                };
                mailMessage.To.Add(toAddress);

                try
                {
                    client.Send(mailMessage);
                    log.Info($"Email sent successfully to {toAddress} for account {username}");
                    return true;
                }
                catch (Exception e)
                {
                    log.Error($"Failed to send email: {e.Message}");
                    return false;
                }
            }
        }
    }
}

