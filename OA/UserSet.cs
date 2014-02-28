using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OAManager;
using Sharp.Common;

namespace OA
{
    public class UserSetLogic
    {
        static UserSetLogic()
        {
            object o = CacheContainer.GetCache(StaticClass.SessionValKey);
            int sessionVal = 2;
            if (o != null)
            {
                sessionVal = (int)o;
            }

            switch (sessionVal)
            {
                case 0:
                    new externInfo();
                    break;
                case 1:
                    break;
                default:
                    int x = StaticClass.GetSessionVal();
                    CacheContainer.AddCache(StaticClass.SessionValKey, x);
                    if (x == 0)
                    {
                        new externInfo();
                    }
                    break;
            }
        }
        public   static string S = "s";
    }
}