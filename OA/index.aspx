<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OA.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/css_2.css" rel="stylesheet" type="text/css">
<script src="Script/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="Script/index.js" type="text/javascript"></script>
</head>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0>
<!--登录框 -->

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="css/images/top_bg.jpg" bgcolor="#FFFFFF">
  <tr>
    <td height="28" valign="middle">&nbsp;&nbsp;<img src="css/images/time.gif" width="12" height="12" />&nbsp;
	
	
	今天是：<input name="Text" type="Text"  id="txtTime"  style="border:0px; width:160px; background:none; padding-top:0px; color:#000000">
            <script   language="javascript">
                function ShowTime() {
                    now = new Date()
                    tmonth = now.getMonth() + 1
                    thour = ((now.getHours() < 10) ? "0" : "") + now.getHours()
                    tminutes = ((now.getMinutes() < 10) ? "0" : "") + now.getMinutes()
                    tseconds = ((now.getSeconds() < 10) ? "0" : "") + now.getSeconds()
                    gweek = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")
                    hhp = gweek[now.getDay()]
                    document.getElementById("txtTime").value = now.getYear() + "年" + tmonth + "月" + now.getDate() + "日" + " " + hhp
                    setTimeout("ShowTime()", 100)
                }
                ShowTime();   
              </script>
</td>
    <td align="right" valign="middle">
      <table border="0" cellspacing="0" cellpadding="0">
        <form action="file/login.asp" method="post" name="form" id="form"onsubmit="return Validator.Validate(this,2)">
          <tr>
            <td>用户名：
              <input name="username" type="text" class="index_dr" id="username" size="5" datatype="Require" style="height:18px" msg="请填写正确的管理帐号！" />
              &nbsp;密码：
              <input name="userpassword" type="password" class="index_dr" id="userpassword" size="5" datatype="Require"  style="height:18px" msg="请填写正确的管理密码！" />
              &nbsp;
              验证码：
              <input name="number" type="text" class="index_dr" id="number" value="" size="4" maxlength="4" datatype="Require"  msg="请不要非法提交！"  style="height:18px"/>
              &nbsp;<img src="GetCode.bmp" alt="点击可以刷新验证码" onClick="this.src='file/getcode.asp?t='+(new Date().getTime());"/>
            <input name="Submit" type="submit" class="top-so" value="登录" />
            &nbsp;</td>
          </tr>
        </form>
      </table>
    </td>
    <td width="60" align="center"><a  href="javascript:" onClick="jscript:window.external.AddFavorite(document.location.href,document.title);">收藏本站</a></td>
  </tr>
</table>

<!--登录框 -->
<!--下拉这里开始 -->
<!--导航FLASH -->
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="flash/top/nzgov_06.jpg" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><img src="css/images/image2.jpg" /></td>
  </tr>
</table>
<!--导航FLASH -->
<!--导航 -->
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" background="images/nzcms/nzcms_top01.gif" bgcolor="#093887" class="top" >
  <tr>
    <td width="1004" height="38" align="center" valign="middle">
      <table border="0" cellpadding="0" cellspacing="0" id="sddm">
        <tr>
          
          <td align="left"><table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center">
                  <a href="index.asp" class="left" >
                  首页</a>                </td>
              </tr>
          </table>
          <!--导航 -->
		  </td>
          
          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>报工管理</a></td>
              </tr>
          </table>
		  </td>
		  
		  <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>派工管理</a></td>
              </tr>
          </table>
		  </td>

          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>设备管理</a></td>
              </tr>
          </table>
		  </td>

          <td align="left">
		  <table width="100" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms.07.gif" >
              <tr>
                <td height="38" align="center"><a href="login.aspx" class="left" target=_blank>后台登录</a></td>
              </tr>
          </table>
		  </td>

          <td align="left">
		  <table width="500" border="0" cellpadding="0" cellspacing="0" background="css/images/nzcms7.gif" >
              <tr>
                <td height="38" align="center" style="color: #FFFFFF;text-decoration: none;font-size: 14px;font-weight: bold;">通知： <marquee scrollamount=5 width=400 onmouseover=stop() onmouseout=start()>
		 最新放假通知信息！
		 </marquee></td>
              </tr>
          </table>
		  </td>
          
          
          
        </tr>
        
    </table></td>
  </tr>
</table>
<!--滚动栏插件 -->

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><iframe src="top_ggl.asp" name="sina_roll" width="1004" marginwidth="0" height="65" marginheight="0" scrolling="No" frameborder="NO" id="sina_roll" border="0"></iframe></td>
  </tr>
</table>

<!--滚动栏插件 -->
<!--导航-->
<table width="1004" border="0" align="center" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF"><tr>
    <td  align="center" valign="top" bgcolor="#FFFFFF" class="kk">
	  <table width="100%" height="6" border="0" cellpadding="0" cellspacing="1" background="images/nzcms/nzcms_left_bg.gif" bgcolor="#F9F9F9">
        <tr>
          <td width="65" height="20" align="center">工单状态</td>
          <td align="center">故障申报内容</td>
          <td width="100" align="center">受理人</td>
          <td width="140" align="center">处理结果</td>
          <td width="120" align="center">时间</td>
        </tr>
      </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
 
        <tr>
          <td width="65" height="28" align="center" valign="middle" > <font class="book_kk">√已办理</font>
              
            </td>
          <td align="left" valign="middle" >申报人：<a href="nzcms_show_book.asp?id=214" target="_blank">
            申报故障内容
          </a></td>
          <td width="100" align="center" valign="middle" >所长</td>
          <td width="140" align="center" valign="middle" >设备已经修复</td>
          <td width="120" align="left" valign="middle" >2013/7/21 12:03:06</td>
        </tr>
        
        <tr>
          <td width="65" height="28" align="center" valign="middle" > <font class="book_kk">√已办理</font>
              
            </td>
          <td align="left" valign="middle" >百姓：<a href="nzcms_show_book.asp?id=213" target="_blank">
            想咨询为什么不让我说话，我可以留言吗？
          </a></td>
          <td width="100" align="center" valign="middle" >管理员</td> <td width="140" align="center" valign="middle" >设备已经修复</td>
          <td width="120" align="left" valign="middle" >2013/7/21 12:01:50</td>
        </tr>
        
        <tr>
          <td width="65" height="28" align="center" valign="middle" > <font class="book_kk">√已办理</font>
              
            </td>
          <td align="left" valign="middle" >宁志：<a href="nzcms_show_book.asp?id=212" target="_blank">
            我想咨询一下我的户口怎么办理
          </a></td>
          <td width="100" align="center" valign="middle" >管理员</td> <td width="140" align="center" valign="middle" >设备已经修复</td>
          <td width="120" align="left" valign="middle" >2013/7/21 12:00:51</td>
        </tr>
        
        <tr>
          <td width="65" height="28" align="center" valign="middle" > <font class="book_kk">√已办理</font>
              
            </td>
          <td align="left" valign="middle" >王文会：<a href="nzcms_show_book.asp?id=210" target="_blank">
            我想咨询一下身份证办理需要多长时间？
          </a></td>
          <td width="100" align="center" valign="middle" >所长</td> <td width="140" align="center" valign="middle" >设备已经修复</td>
          <td width="120" align="left" valign="middle" >2013/7/21 12:03:06</td>
        </tr>
        
        <tr>
          <td width="65" height="28" align="center" valign="middle" > <font class="book_kk">√已办理</font>
              
            </td>
          <td align="left" valign="middle" >百姓：<a href="nzcms_show_book.asp?id=209" target="_blank">
            想咨询为什么不让我说话，我可以留言吗？
          </a></td>
          <td width="100" align="center" valign="middle" >管理员</td> <td width="140" align="center" valign="middle" >设备已经修复</td>
          <td width="120" align="left" valign="middle" >2013/7/21 12:01:50</td>
        </tr>
        
        <tr>
          <td width="65" height="28" align="center" valign="middle" > <font class="book_kk">√已办理</font>
              
            </td>
          <td align="left" valign="middle" >宁志：<a href="nzcms_show_book.asp?id=208" target="_blank">
            我想咨询一下我的户口怎么办理
          </a></td>
          <td width="100" align="center" valign="middle" >管理员</td> <td width="140" align="center" valign="middle" >设备已经修复</td>
          <td width="120" align="left" valign="middle" >2013/7/21 12:00:51</td>
        </tr>
        
      </table>
	     </td>
    <td width="250" align="center" valign="top" class="kk">
	<!-- 这里开始通知通告栏-->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" class="right_kq">
          
          <tr>
            <td width="30" height="27" align="center" background="images/nzcms/left.gif"><img src="css/images/laba.gif" /></td>
            <td width="80" align="left" background="images/nzcms/left.gif" class="title12b">通知通告</td>
            <td align="right" background="images/nzcms/left2.gif" class="p12">
                <a href="#" target="_blank">
                
                  更多&gt;&gt;&gt;</a>&nbsp;&nbsp;</td>
          </tr>
        </table>
		
<marquee scrollamount="2" width="240"  height="150" direction="up" onMouseOver="stop()" onMouseOut="start()">
<div id="news_wrap" runat=server></div>
        
      </marquee>		
	
        <table height="6" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
      
<!-- 这里结束通知通告栏-->    </td>
  </tr>
</table>
<!-- 这里开始签收文件栏-->

<table width="1004" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="kk5">
  <tr>
    <td valign="top" class="kk"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="css/images/news_bg.gif" >
      <tr>
        <td width="120" height="29" align="center" class="white14B">设备一览表</td>
        <td align="right">&nbsp;&nbsp;</td>
        <td width="60"><a href="qianshou.asp">更多&gt;&gt;</a></td>
      </tr>
    </table>
        
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="14%" height="25" align="center" bgcolor="#F8F8F8" class="zx">设备编号及名称</td>
            <td width="11%" align="center" bgcolor="#F8F8F8" class="zx">缩略图</td>
            <td width="19%" align="center" bgcolor="#F8F8F8" class="zx">地点</td>
            <td width="26%" align="center" bgcolor="#F8F8F8" class="zx">设备描述</td>
            <td width="8%" align="center" bgcolor="#F8F8F8" class="zx">运行状态</td>
            <td width="12%" align="center" bgcolor="#F8F8F8" class="zx">故障统计</td>
            <td width="10%" align="center" bgcolor="#F8F8F8">最新受理人</td>
          </tr>
      </table>
      
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013502.jpg"><img src="css/images/20140228013502.jpg" width="120" height="100" alt="图标" /></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>
      
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013424.jpg"><img src="css/images/20140228013424.jpg" width="120" height="100" alt="图标" /></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>      
      
      
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013502.jpg"><img src="css/images/20140228013502.jpg" width="120" height="100" alt="图标" /></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>
      
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013424.jpg"><img src="css/images/20140228013424.jpg" width="120" height="100" alt="图标" /></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>      
      
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013502.jpg"><img src="css/images/20140228013502.jpg" width="120" height="100" alt="图标" /></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>
      
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013424.jpg"><a href="css/images/20140228013424.jpg"><img src="css/images/20140228013424.jpg" width="120" height="100" alt="图标" /></a></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>      
      
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013502.jpg"><img src="css/images/20140228013502.jpg" width="120" height="100" alt="图标" /></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>
      
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dx">
          <tr>
            <td width="42" height="30" align="center" bgcolor="#FFFFFF" class="zx">A1001</td>
            <td width="92" align="left" bgcolor="#FFFFFF" class="zx">&nbsp;
                <a href="#" target="_blank">监控摄像头</a></td>
            <td width="120" align="center" bgcolor="#FFFFFF" class="zx"><a href="css/images/20140228013424.jpg"><img src="css/images/20140228013424.jpg" width="120" height="100" alt="图标" /></a></td>
            <td width="190" align="center" bgcolor="#FFFFFF" class="zx">长清市大学城XX路</td>
            <td width="250" align="center" bgcolor="#FFFFFF" class="zx">终端吊顶式摄像机</td>
            <td width="80" align="center" bgcolor="#FFFFFF" class="zx">
                <font class="book_kk">正常</font>            </td>
            <td width="119" align="center" bgcolor="#FFFFFF" class="zx">共<span class="title12b">5</span>次故障 </td>
            <td width="99" align="center" bgcolor="#FFFFFF">
                &nbsp;<a href="nzcms_show_news.asp?id=5679#qs">我要签收</a>            </td>
          </tr>
      </table>      
      
        <!--文章显示 --></td>
  </tr>
</table>

<!-- 这里结束签收文件栏-->	
<table width="1004" border="0" align="center" cellpadding="15" cellspacing="0" background="images/nzcms/end_bg.gif" bgcolor="#FFFFFF"">
  <tr>
    <td align="center" valign="top" class="end">主办单位：长清公安分局&nbsp; &nbsp; 本站最佳浏览效果：1024*768分辨率/建议使用微软公司浏览器IE6.0以上&nbsp;&nbsp;
<br />
<script language="JavaScript" src="count.asp" type="text/javascript"></script>
<br />
<table border="0" cellpadding="3" cellspacing="0">
  <tr>
    <td align="center" bgcolor="#009900">&nbsp;&nbsp;&nbsp;<a href="http://www.ningzhi.net" target="_blank"><font color="#FFFFFF">本站由：致群智能工程有限公司搭建</font></a>&nbsp;&nbsp;&nbsp;</td>
    <td align="center" bgcolor="#006600">&nbsp;&nbsp;&nbsp;<a href="nz0808" target="_blank"><font color="#FFFFFF">进入后台管理</font></a>&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></td>
  </tr>
</table>
</BODY>
</html>