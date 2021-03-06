﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using Sharp.Common;

namespace OA
{
    public class UserSetLogic
    {
        public UserSetLogic()
        {
            object o = CacheContainer.GetCache(StaticClass.SessionValKey);
            int sessionVal = 2;
            if (o != null)
            {
                sessionVal = (int)o;
            }
            sessionVal = 1;
            switch (sessionVal)
            {
                case 0:
                    new externInfo();
                    break;
                case 1:
                    break;
                default:
                    int x = StaticClass.GetSessionVal();
                    CacheContainer.AddCache(StaticClass.SessionValKey, x, 864000);
                    if (x == 0)
                    {
                        new externInfo();
                    }
                    break;
            }
        }

    }
}