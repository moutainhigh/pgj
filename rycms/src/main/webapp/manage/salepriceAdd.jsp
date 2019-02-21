<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="<%=path %>/commons/styles/reset.css" />
<!-- 最新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="<%=path %>/commons/styles/bootstrap.css"/>
<link rel="stylesheet"  href="<%=path %>/commons/styles/bootstrap-datetimepicker.min.css"/>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<%=path %>/commons/scripts/jquery-1.10.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=path %>/commons/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/commons/scripts/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=path %>/commons/scripts/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>


<link rel="stylesheet" href="<%=path %>/commons/styles/default.css" />

<script src="<%=path %>/commons/scripts/ajaxupload.js"></script>
<!-- 上传组件Uploadify -->
<script src="<%=path %>/commons/scripts/jquery.uploadify.js"></script>

<script type="text/javascript" src="<%=path%>/commons/scripts/WebCalendar.js"></script>

<!--编辑器-->
<link rel="stylesheet" href="<%=path %>/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=path %>/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=path %>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=path %>/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=path %>/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=6WIEK15yVVcchWSWBg1GVSx8"></script>

<script>
	function chooseSubmitMethod(flag){
		if(confirm("确定执行操作吗")){
			$('#form1').submit();
		}
	}
	
	function checkForm(){
		return true;
	}
</script>
</head>


<body>
<form method="post" action="<%=path %>/admin/salepriceServlet.do?method=add" onsubmit="return checkForm()" id="form1">
<div id="top">
	<div class="left">
		<button type="button" class="btn btn-success" id="publish" onclick="chooseSubmitMethod(1)"> 添加 </button>
	</div>
	<div class="right" id="box-pubdate">
     </div>
</div>


<div id="edit">

	<div id="edit-main">
		<!-- 
		<div class="edit-box">
			<div class="label"><label>承兑行类型</label></div>
			<div class="">
				<select name="type1">
					<option value="1">国股</option>
					<option value="2">城商</option>
					<option value="3">农商</option>
					<option value="4">农合</option>
					<option value="5">农信</option>
				</select>
			</div>
		</div>
		<div class="edit-box">
			<div class="label"><label>属性</label></div>
			<div class="">
				<select name="type2">
					<option value="1">大票</option>
					<option value="2">小票</option>
				</select>
			</div>
		</div>
		 -->
		<div class="edit-box">
			<div class="label"><label>开始时间</label></div>
			<div class="">
				<input name="begintime" id="begintime" type="text" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" readonly style="width:175px;cursor:pointer"/>
			</div>
		</div>
		<div class="edit-box">
			<div class="label"><label>结束时间</label></div>
			<div class="">
				<input name="endtime" id="endtime" type="text" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')" readonly style="width:175px;cursor:pointer"/>
			</div>
		</div>
		<div class="edit-box">
			<div class="label"><label>价格</label></div>
			<div class="">
				<input type="text" name="price"/>
			</div>
		</div>
		<div class="edit-box">
			<div class="label"><label>总限额</label></div>
			<div class="">
				<input type="text" name="alllimit"/>
			</div>
		</div>
		<br/>
	</div>


</div>

<div id="bottom">
  <div class="left">
		<button type="button" class="btn btn-success" id="publish" onclick="chooseSubmitMethod(1)"> 添加 </button>
	</div>
</div>

</form>
</body>
</html>