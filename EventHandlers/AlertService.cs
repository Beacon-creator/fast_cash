using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fast_Cash.EventHandlers
{
    public interface IAlertService
    {
        Task ShowAlertAsync(string title, string message, string cancel);
    }

    public class AlertService : IAlertService
    {
        public Task ShowAlertAsync(string title, string message, string cancel)
        {
            return Application.Current.MainPage.DisplayAlert(title, message, cancel);
        }
    }
}
