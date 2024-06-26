﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Fast_Cash.EventHandlers
{
    public static class ServiceProviderHelper
    {
        public static IServiceProvider ServiceProvider { get; set; }

        public static T GetService<T>()
        {
            return ServiceProvider.GetService<T>();
        }
    }
}
