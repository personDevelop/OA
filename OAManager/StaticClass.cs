using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OAEntity;
using Sharp.Common.Common;
using System.Management;

namespace OAManager
{
    public static class StaticClass
    {
        public static string SessionValKey = "sessionVal";
        public static char SessionValKey1 = '|';
        public static int GetSessionVal()
        {
            UserSetManager logic = new UserSetManager();
            UserSet s = logic.GetItemById();
            if (s == null)
            {
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
                if (sarr.Length > 2)
                {
                    string f = sarr[2];
                    string info = sarr[3];
                    if (info == GetInfo())
                    {
                        return 1;

                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    string n = DateTime.Now.ToString("yyyyMMdd");
                    if (n.CompareTo(d) > 0)
                    {
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



        private static string GetInfo()
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
            return Info.ToString()  ;
        }
        public static string ext = "727F9213030F69982403C798B87B8640754B976FD681763DB08117E17BD365A463CEC90F0A0E057978E76625FC2A50E920798B3E2E7C6EC9BE4B124A6933812985C7BCC1B83D76F7AED52F63155FCBCD";

    }
    public class myinfo : Exception
    {
        public myinfo(string msg)
            : base(msg)
        {

        }
    }

}
