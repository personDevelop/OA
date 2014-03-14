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
            if (dateTimePicker1.Value >= dateTimePicker2.Value)
            {
                System.Windows.Forms.MessageBox.Show("【使用到期日期】必须大于【安装到期日期】");
                return;
            }
            string key = GetKey();
            UserSet u = new UserSetManager().GetItemById();
            if (u == null)
            {
                u = new UserSet();
                u.ID = Guid.NewGuid();
            }
            u.UserInfo = key;
            new UserSetManager().Save(u);
            textBox1.Text = u.UserInfo;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dateTimePicker1.Value >= dateTimePicker2.Value)
            {
                System.Windows.Forms.MessageBox.Show("【使用到期日期】必须大于【安装到期日期】");
                return;
            }
            textBox1.Text = GetKey();
        }


        private string GetKey()
        {




            return (checkBox1.Checked.ToString() + "|" + dateTimePicker1.Value.ToString("yyyyMMdd") + "|" + dateTimePicker2.Value.ToString("yyyyMMdd")).Open().Open();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Text = textBox1.Text.Close();
        }
    }
}
