using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using OAEntity;
using OAManager;
using Sharp.Common.Common;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            UserSet u = new UserSetManager().GetItemById();
            if (u == null)
            {
                u = new UserSet();
                u.ID = Guid.NewGuid();
            }
            u.UserInfo =( checkBox1.Checked.ToString() + "|" + dateTimePicker1.Value.ToString("yyyyMMdd")).Open().Open();
            new UserSetManager().Save(u);
            textBox1.Text = u.UserInfo;
        }
    }
}
