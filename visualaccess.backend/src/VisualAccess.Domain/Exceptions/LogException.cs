using System;
using log4net;

namespace VisualAccess.Domain.Exceptions
{
    public static class LogException
    {
        public static void Log(ILog log, Exception e)
        {
            log.Error($"Error Message: {e.Message.Trim()}");
            if (e.InnerException is not null)
            {
                var innerExceptionMessage = e.InnerException.Message;
                var detailIndex = innerExceptionMessage.IndexOf("DETAIL:");
                if (detailIndex >= 0)
                {
                    innerExceptionMessage = innerExceptionMessage.Substring(0, detailIndex);
                }

                log.Error($"InnerException message: {innerExceptionMessage.Trim()}");
            }
        }
    }
}


