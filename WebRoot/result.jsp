<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String patientId = request.getParameter("patientId");
	String checkTime = request.getParameter("checkTime");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /><meta name="apple-mobile-web-app-capable" content="yes" /><meta name="apple-mobile-web-app-status-bar-style" content="black" /><meta name="format-detection" content="telephone=yes" /><meta name="format-detection" content="email=no" />
<title>
</title>
<link rel="stylesheet" type="text/css" href="/visit/css/css.css" />
<style type="text/css">
.overlay{position:fixed;top:0;right:0;bottom:0;left:0;z-index:998;width:100%;height:100%;_padding:0 20px 0 0;display:none;}
.showbox{position:fixed;top:0;left:50%;z-index:9999;opacity:0;filter:alpha(opacity=0);margin-left:-80px;}
*html .showbox,*html .overlay{position:absolute;top:expression(eval(document.documentElement.scrollTop));}
#AjaxLoading div.loadingWord{width:180px;height:50px;line-height:50px;}
</style>
<script type="text/javascript" src="/visit/js/jquery.js"></script>
<script type="text/javascript" src="/visit/js/DeleteSession.js"></script>
<script type="text/javascript" src="/visit/js/ShowTip.js"></script>
</head>
<body>
    <div class="mtzrl_box">
      <div id="template"/>
    </div>
    <div class="overlay">&nbsp;</div>
<div class="showbox" id="AjaxLoading">
<div class="loadingWord" style="overflow:hidden;zoom:1"  align="center"><img src="/visit//images/loadingx.gif" alt="" style="padding-top:6px;"/></div>
</div>
</body>
</html>
<script type="text/javascript">
qryPatientVisit();
function qryPatientVisit()
{
	var obj = "";
	var dig = null;
	$.ajax({
		type : "POST",
		url : "/visit/patientVisit.do?method=qryCheckResult&patientId=<%=patientId%>&checkTime=<%=checkTime%>",
		data : obj,
		contentType : "application/json;charset=UTF-8",
		dataType : "json",
		beforeSend : function()
		{
		  $(".overlay").css({ 'display': 'block', 'opacity': '0.8' }); $(".showbox").stop(true).animate({ 'margin-top': '300px', 'opacity': '1' }, 0);
		},
		success : function(data)
		{
			 $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
			try
			{
				dig.close();
			}
			catch(e)
			{
				
			}
			var content ="";
			var checkType="";
			$.each(data.results, function(i, obj)
		    {
				if(checkType=='' && checkType!=obj.check_type)
				{
					content+="<div class='title' ><li>"+obj.check_type+"</li></div>";
					content+="<div class='mq_box'>";
					content+="<div class='mq_con_list'>";
					checkType=obj.check_type;
				}else if(checkType!='' && checkType!=obj.check_type)
				{
					content+="</div></div>";
					content+="<div class='title'><li>"+obj.check_type+"</li></div>";
					content+="<div class='mq_box'>";
					content+="<div class='mq_con_list'>";
					checkType=obj.check_type;
				}
				content+="<li><dl class='mq_word'>";
				i=i+1;
	   			content+="<dd>检查项目:"+obj.check_name+"</dd><dd>检查结果:"+obj.check_result+"</dd><dd>参考范围:"+obj.check_scope+"</dd><dd>计量单位:"+obj.check_unit+"</dd>";
	   			content+="</dl></li>";
	   			
			});
			
			$("#template").html(content);

		},
		error : function(data)
		{
			 $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
			$("#template").html("暂无信息");
		//	$.dialog.alert(data.statusText, function(){window.location.reload(); return true;});
		}
	});
}
</script>