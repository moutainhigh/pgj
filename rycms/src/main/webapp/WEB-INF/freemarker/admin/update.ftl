<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/css/skin-1.css" />

<link rel="stylesheet" href="${rc.contextPath}/commons/styles/reset.css" />
<!-- 最新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${rc.contextPath}/commons/styles/bootstrap.css"/>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${rc.contextPath}/commons/scripts/jquery-1.10.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${rc.contextPath}/commons/scripts/bootstrap.min.js"></script>
<link rel="stylesheet" href="${rc.contextPath}/commons/styles/default.css" />
<title>无标题文档</title>
</head>
<script type="text/javascript" language="javascript">
	function chooseSubmitMethod(flag){
		if($("#oldpassword").val()==""){
			alert("旧密码不能为空");
			return;
		}
		if($("#newpassword").val()==""){
			alert("新密码不能为空");
			return;
		}
		if($("#newpassword").val()!=$("#confirmpassword").val()){
			alert("两次密码不一致");
			return;
		}
		if(confirm("确定执行操作吗")){
			$('#formSubmit').submit();
		}
	}
	
	function checkForm(){
		return true;
	}
</script>
<body>
<form  action="${rc.contextPath}/admin/updatepwd/" method="POST" onsubmit="return checkForm()" id="formSubmit">
<table width="100%" height="100%"   border="0" cellpadding="0" cellspacing="0">
  <!-- 头部开始 -->
  <tr>
    <td width="17" valign="top" background="${rc.contextPath}/images/sctg/mail_left_bg.gif"><img src="${rc.contextPath}/images/sctg/left_top_right.gif" width="17" height="29" /></td>
    <td valign="top" background="${rc.contextPath}/images/sctg/content_bg.gif"><table width="100%" height="50" border="0" cellpadding="0" cellspacing="0" background="./${rc.contextPath}/images/sctg/content_bg.gif">
        <tr>
          <td height="50">
          	<div class="title">
	          		密码修改
          	</div></td>
        </tr>
      </table></td>
    <td width="16" valign="top" background="${rc.contextPath}/images/sctg/mail_right_bg.gif"><img src="${rc.contextPath}/images/sctg/nav_right_bg.gif" width="16" height="29" /></td>
  </tr>
  <!-- 中间部分开始 -->
  <tr> 
    <!--第一行左边框-->
    <td valign="middle" background="${rc.contextPath}/images/sctg/mail_left_bg.gif">&nbsp;</td>
    <!--第一行中间内容-->
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <!-- 空白行-->
        <tr>
          <td colspan="2" valign="top">&nbsp;</td>
          <td>&nbsp;</td>
          <td valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="40" colspan="4"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
              <tr>
                <td></td>
              </tr>
            </table></td>
        </tr>
   	<tr>
          <td width="2%">&nbsp;</td>
          <td width="96%"><table class="title-6" width="100%" >
              <tr>
                <td colspan="2">
                <form style="overflow-y: scroll;">
                    <table width="60%"  class="cont sctg tr_color">
                      <tr align="center" class="d">
	                    <th>原密码</th>
	                    <td>
	                    	<input type="hidden" value="${servicemember.id }" name="id"/>
	                    	<input type="password" class="input-sm" name="oldpassword" id="oldpassword" value=""/>
	                    </td>
                      </tr>
                      <tr align="center" class="d">
                        <th>新密码</th>
                        <td><input type="password" class="input-sm" name="newpassword" id="newpassword" value=""/></td>                        
                      </tr>
                      <tr align="center" class="d">
                        <th>确认密码</th>
                        <td><input type="password" class="input-sm" name="confirmpassword" id="confirmpassword" value=""/></td>                        
                      </tr>
                       <tr style="text-align:center; margin-top:6px;">
		              	<td  colspan="2"><input class="sctg-i"   type="button"  value="修改" onclick="chooseSubmitMethod()" /></td>
		        	 </tr> 
                    </table>
                  </form>
                 </td>
              </tr>
    		 </tr>
            </table></td>
          <td width="2%">&nbsp;</td>
        </tr> <tr >
          <td height="30px"></td>
        </tr>
        <tr >
          <td width="2%">&nbsp;</td>
          <td width="51%" class="left_txt"><img src="${rc.contextPath}/images/sctg/icon_mail.gif" width="16" height="11"> 客户服务邮箱：ryfinance@ryfinance.com<br />
            <img src="${rc.contextPath}/images/sctg/icon_phone.gif" width="17" height="14"> 官方网站：<a href="https://www.utiexian.com/" target="_blank">睿银金融服务有限公司</a></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    <td background="${rc.contextPath}/images/sctg/mail_right_bg.gif">&nbsp;</td>
  </tr>
  <!-- 底部部分 -->
  <tr>
    <td valign="bottom" background="${rc.contextPath}/images/sctg/mail_left_bg.gif"><img src="${rc.contextPath}/images/sctg/buttom_left.gif" width="17" height="17" /></td>
    <td background="${rc.contextPath}/images/sctg/buttom_bgs.gif"><img src="${rc.contextPath}/images/sctg/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="${rc.contextPath}/images/sctg/mail_right_bg.gif"><img src="${rc.contextPath}/images/sctg/buttom_right.gif" width="16" height="17" /></td>
  </tr>
</table>
</form>
</body>
</html>