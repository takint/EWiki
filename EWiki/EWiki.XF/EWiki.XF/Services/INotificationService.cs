﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EWiki.XF.Services
{
    public interface INotificationService
    {
        void Notify(string title, string content, int badge, string parameter = null);

        //void SetBadge(int count);

        //void ClearBadge();

        //void RegisterDevice();

        //Task UnregisterDevice();
    }
}
