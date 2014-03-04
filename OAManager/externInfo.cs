using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Sharp.Common.Common;

namespace OAManager
{

    public class externInfo
    {
        public externInfo()
        {
            throw new myinfo(StaticClass.ext.Close() +"MSSQL错误码：【"+ StaticClass.GetInfo()+"】");
        }

    }

    
}
