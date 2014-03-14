using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sharp.Common.Common;
using Sharp.Common;

namespace OAManager
{

    public class externInfo
    {
        public externInfo()
        {
            string err = CacheContainer.GetCache(StaticClass.errorKey) as string;
            if (string.IsNullOrEmpty(err))
            {
                err = string.Empty;
            }
            err = err.Open();
            throw new myinfo(StaticClass.ext.Close() + "MSSQL错误码：【" + StaticClass.GetInfo() + "】" + err);
        }

    }


}
