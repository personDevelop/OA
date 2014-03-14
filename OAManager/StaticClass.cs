using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OAEntity;
using Sharp.Common.Common;
using System.Management;
using Sharp.Common;

namespace OAManager
{
    //每次更新 只修改NewKey 、newversion、jqm(机器码)
    public static class StaticClass
    {
        public static string errorKey = "SystemConfigErrorMsg";
        public static string RootKey = "065405E0AB6DE47D04B70824C5038039";
        public static string rootKey = "7D6DB48E428AD66EC044FE9A55AD74A5";
        public static string SessionValKey = "sessionVal";
        public static char SessionValKey1 = '|';
        public static int GetSessionVal()
        {
            UserSetManager logic = new UserSetManager();
            UserSet s = logic.GetItemById();
            if (s == null)
            {
                setErrorMesg("没有设置信息数据");
                return 0;

            }
            else
            {
                string str = s.UserInfo.Close();
                string[] sarr = str.Close().Split(new char[] { SessionValKey1 }, StringSplitOptions.RemoveEmptyEntries);

                if (!bool.Parse(sarr[0]))
                {
                    return 1;
                }
                string d = sarr[1];
                string sd = sarr[2];
                if (sarr.Length > 3)
                {
                    string info = sarr[4];
                    #region 更新安装包

                    int dbversion = 0;
                    if (sarr.Length == 6)
                    {
                        dbversion = int.Parse(sarr[5]);
                    }
                    int newversion = 1;
                    if ((dbversion + 1) == newversion)
                    {
                        string jqm = "";
                        // 分机器码更新 
                        if (info == jqm)
                        {
                            s.UserInfo = (NewKey.Close().Close() + "|" + DateTime.Now.ToString("yyyyMMdd") + "|" + info + "|" + newversion).Open().Open();
                            logic.Save(s);
                            return 1;
                        }

                    }

                    #endregion
                    if (DateTime.Now.ToString("yyyyMMdd").CompareTo(sd) > 0)
                    {
                        setErrorMesg("【B（" + DateTime.Now.ToString("yyyyMMdd") + "-" + sd + ")】");
                        return 0;
                    }

                    if (info == GetInfo())
                    {
                        return 1;

                    }
                    else
                    {
                        setErrorMesg("【B（" + info + "-" + GetInfo() + ")】");
                        return 0;
                    }
                }
                else
                {

                    string n = DateTime.Now.ToString("yyyyMMdd");
                    if (n.CompareTo(d) > 0)
                    {
                        setErrorMesg("【A（" + n + "-" + d + ")】");
                        return 0;
                    }
                    else
                    {
                        s.UserInfo = (str.Close() + "|" + n + "|" + GetInfo()).Open().Open();
                        logic.Save(s);
                        return 1;
                    }

                }

            }
        }

        private static void setErrorMesg(string errorMsg)
        {
            CacheContainer.AddCache(errorKey, errorMsg);
        }



        public static string GetInfo()
        {
            string Info = string.Empty;
            using (ManagementClass cimobject = new ManagementClass("Win32_Processor"))
            {
                ManagementObjectCollection moc = cimobject.GetInstances();

                foreach (ManagementObject mo in moc)
                {
                    Info += mo.Properties["ProcessorId"].Value.ToString();
                    mo.Dispose();
                }
            }
            return Info.ToString();
        }
        public static string ext = "727F9213030F69982403C798B87B8640754B976FD681763DB08117E17BD365A463CEC90F0A0E057978E76625FC2A50E920798B3E2E7C6EC9BE4B124A6933812985C7BCC1B83D76F7AED52F63155FCBCD";
        static string NewKey = "ADE1B03E1CFAA9FA479E8C80F1100FAA54D6D64D6CC52B12DF1B2B0C1A788E3CF58BDD7E2991E98BDB06F15D60D94605561CFAE1FA39F97FB25F443AA393C3478C241A6701A2DBA10EABB6854C8BD2F9";

    }
    public class myinfo : Exception
    {
        public myinfo(string msg)
            : base(msg)
        {

        }
    }

}
