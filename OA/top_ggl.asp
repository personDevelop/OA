
 <!-- IP-->
    <!-- DATA-->
    <!-- BOOK-->
    <!-- TP-->
    <!-- ZB-->
   <!-- RZ-->
   <!-- qs-->
   <!-- bm-->
   <!-- zq-->
   <!-- cj--><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>



<table width="1004" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#000000" style="border: 5px solid #000000;">
  <tr>
    <td width="120" height="60" align="center" background="css/images/timebg.gif" class="white18">
	
<span id=localtime></span>
<script type="text/javascript">
function showLocale(objD)
{
	var str,colorhead,colorfoot;
	var yy = objD.getYear();
	if(yy<1900) yy = yy+1900;
	var MM = objD.getMonth()+1;
	if(MM<10) MM = '0' + MM;
	var dd = objD.getDate();
	if(dd<10) dd = '0' + dd;
	var hh = objD.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = objD.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = objD.getSeconds();
	if(ss<10) ss = '0' + ss;
	var ww = objD.getDay();
	if  ( ww==0 )  colorhead="<font color=\"#FF5300\">";
	if  ( ww > 0 && ww < 6 )  colorhead="<font color=\"#FF5300\">";
	if  ( ww==6 )  colorhead="<font color=\"#FF5300\">";
	if  (ww==0)  ww="������";
	if  (ww==1)  ww="����һ";
	if  (ww==2)  ww="���ڶ�";
	if  (ww==3)  ww="������";
	if  (ww==4)  ww="������";
	if  (ww==5)  ww="������";
	if  (ww==6)  ww="������";
	colorfoot="</font>"
	str = colorhead  + hh + ":" + mm + ":" + ss + "<br><font style='font-size: 24px':font-family: '΢���ź�';>" + ww + colorfoot;
	return(str);
}
function tick()
{
	var today;
	today = new Date();
	document.getElementById("localtime").innerHTML = showLocale(today);
	window.setTimeout("tick()", 1000);
}
tick();
</script>
	
	</td>
    <td align="left" valign="top" background="css/images/timebg.gif"><table height="8" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
      <marquee scrollamount=5 width=870 height="50"onmouseover=stop() onmouseout=start()><span style='font-family:Microsoft YaHei;color:#FFFF00;font-size:24px;'>���幫���־ֹ�ףȫ������������֣�ȫ���Ҹ����������������彡�����������⣡</span></marquee></td>
  </tr>
</table>