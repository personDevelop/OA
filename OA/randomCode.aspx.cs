using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;


namespace OA
{
    public partial class randomCode : System.Web.UI.Page
    {
        static string[] FontItems = new string[] { "Arial", "Helvetica", "Geneva", "sans-serif", "Verdana" };
        static Brush[] BrushItems = new Brush[] 
        {
            Brushes.OliveDrab, 
            Brushes.ForestGreen, 
            Brushes.DarkCyan, 
            Brushes.LightSlateGray, 
            Brushes.RoyalBlue, 
            Brushes.SlateBlue, 
            Brushes.DarkViolet, 
            Brushes.MediumVioletRed, 
            Brushes.IndianRed, 
            Brushes.Firebrick, 
            Brushes.Chocolate, 
            Brushes.Peru, 
            Brushes.Goldenrod  
        };
        static string[] BrushName = new string[] 
        {
            "OliveDrab", 
            "ForestGreen", 
            "DarkCyan", 
            "LightSlateGray", 
            "RoyalBlue", 
            "SlateBlue", 
            "DarkViolet", 
            "MediumVioletRed", 
            "IndianRed", 
            "Firebrick", 
            "Chocolate", 
            "Peru", 
            "Goldenrod" 
        };
        private static Color BackColor = Color.White;
        private static Pen BorderColor = Pens.DarkGray;
        private static int Width = 52;
        private static int Height = 21;
        private Random _random;
        private string _code;
        private int _brushNameIndex;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this._random = new Random();
                this._code = GetRnadomCode();
                Session["Very_Code"] = this._code;
                this.SetPageNoCache();
                this.OnPanit();
            }
        }
        //清除页面缓存
        private void SetPageNoCache()
        {
            Response.Buffer = true;
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.AppendHeader("Pragma", "No-Cache");
        }
        //获取随机码
        private string GetRnadomCode()
        {
            return Guid.NewGuid().ToString().Substring(0, 4);
        }

        private Font GetFont()
        {
            int fontIndex = _random.Next(0, FontItems.Length);
            FontStyle fontStyle = GetFontStyle(fontIndex);
            return new Font(FontItems[fontIndex], 12, fontStyle);

        }
        private FontStyle GetFontStyle(int index)
        {
            switch (index)
            {
                case 0:
                    return FontStyle.Bold;
                case 1:
                    return FontStyle.Italic;
                default:
                    return FontStyle.Regular;
            }
        }
        private Brush GetBrush()
        {
            int brushIndex = _random.Next(0, BrushItems.Length);
            _brushNameIndex = brushIndex;
            return BrushItems[brushIndex];
        }
        private void OnPanit()
        {
            Bitmap objBitMap = null;
            Graphics g = null;
            try
            {
                objBitMap = new Bitmap(Width, Height);
                g = Graphics.FromImage(objBitMap);
                Paint_Background(g);
                Paint_Text(g);
                Paint_TextStain(objBitMap);
                Paint_Border(g);
                objBitMap.Save(Response.OutputStream, ImageFormat.Gif);
                Response.ContentType = "image/gif";
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (null != objBitMap)
                    objBitMap.Dispose();
                if (null != g)
                    g.Dispose();
            }
        }

        private void Paint_Background(Graphics g)
        {
            g.Clear(BackColor);
        }
        private void Paint_Border(Graphics g)
        {
            g.DrawRectangle(BorderColor, 0, 0, Width - 1, Height - 1);
        }
        private void Paint_Text(Graphics g)
        {
            g.DrawString(_code, GetFont(), GetBrush(), 3, 1);
        }
        private void Paint_TextStain(Bitmap b)
        {
            for (int n = 0; n < 30; n++)
            {
                int x = _random.Next(Width);
                int y = _random.Next(Height);
                b.SetPixel(x, y, Color.FromName(BrushName[_brushNameIndex]));
            }
        } 
    }
}