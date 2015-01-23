<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String visitId = request.getParameter("visitId");
	String copyFlag = request.getParameter("copyFlag");
	String patientId = request.getParameter("patientId");
	String name = request.getParameter("name");
	String operType = request.getParameter("operType");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /><meta name="apple-mobile-web-app-capable" content="yes" /><meta name="apple-mobile-web-app-status-bar-style" content="black" /><meta name="format-detection" content="telephone=yes" /><meta name="format-detection" content="email=no" /><title>
</title>
<link rel="stylesheet" type="text/css" href="css/select.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="/visit/js/DeleteSession.js"></script>
<link rel="stylesheet" type="text/css" href="/visit/css/css.css" />
		<style type="text/css">
		.overlay{position:fixed;top:0;right:0;bottom:0;left:0;z-index:998;width:100%;height:100%;_padding:0 20px 0 0;display:none;}
		.showbox{position:fixed;top:0;left:50%;z-index:9999;opacity:0;filter:alpha(opacity=0);margin-left:-80px;}
		*html .showbox,*html .overlay{position:absolute;top:expression(eval(document.documentElement.scrollTop));}
		#AjaxLoading div.loadingWord{width:180px;height:50px;line-height:50px;}
		</style>
</head>
<body>
  
    <div class="tzrl_box">
    <div class="mq_box">
    	 <div class="mq_con_list">
		 <li>
            <dl class="mq_word">
              <table width="100%">
					<tr>
						<td width="50%"><label for="red">姓名：<%=name %></label></td>
						<td width="50%"><label for="red">病案号：<%=patientId %></label></td>
					</tr>
					<tr>
						<td colspan="2"><label for="red">手术类型：<%=operType %></label></td>
					</tr>
				</table>
                                  
              </dl>
           </li>
	     </div>		
        <div class="mq_box">
           
            <div class="mq_con_list">
                <ul>
               
	                <div id="template"/>
	             	
                </ul>
            </div>
        </div>
     <div id="checkDiv"  style="display:none;">
     <div class="log_box" >
 		 <li class="btn_submit">
                    <button id="submitType" name="submitType" type="submit">诊断</button>
         </li>
     </div>
 	</div>
 	<div id="rstDiv" style="display:none;">
        <div class="hot_com" >
            <h4> 诊断结果</h4>
              <div id="result"/>
        </div>
        </div>
        <br />
         <div class="overlay">&nbsp;</div>
<div class="showbox" id="AjaxLoading">
<div class="loadingWord" style="overflow:hidden;zoom:1"  align="center"><img src="/visit//images/loadingx.gif" alt="" style="padding-top:6px;"/></div>
</div>
</body>
</html>

<script type="text/javascript" language="JavaScript" >
   qryPatientVisit();
   function qryPatientVisit()
   {
		
	   	var obj = "";
	   	var dig = null;
	   	$.ajax({
	   		type : "POST",
	   		url : "/visit/patientVisit.do?method=qryVisitDetail&visitId=<%=visitId%>",
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
	   		
	   			$.each(data.visits, function(i, obj)
	   		    {
	   				var val=obj.codeValFlag;
	   				content+="<li>";
	   				
	   				i=i+1;
		   	   		if(obj.codeValFlag.indexOf("ImgWeb")>-1)
	   				{
		   	   			content+="<dl class='mq_word'>"+i+"、彩超和心电图检查图</dl>";
		   	   			var imgs=val.split(",");
		   	   			if(imgs.length>0)
		   	   			{
		   	   				content+="<dl class'mq_img'>";
		   	   				for(var i=0;i<imgs.length;i++)
		   	   				{
		   	   					var imgUrl=imgs[i];
		   	   					if(imgUrl==null || imgUrl=='')
		   	   					{
		   	   						continue;
		   	   					}
		   	   					content+="<img onclick=showImg('"+imgUrl+"') src='http://123.57.78.38:10841"+imgUrl+"' width='60px' height='60px' border='0'/>       ";
		   	   				}
		   	   				content+="</dl>";
		   	   			}
	   				}else
	   				{
		   	   			content+="<dl class='mq_word'>"+i+"、"+obj.codeFlagVal+"<dd>"+val+"</dd></dl>";
	   				}
	   	   			content+"</li>";
	   			});
	   			
	   			$("#template").html(content);
	 			var result=data.wakeContent;
	 			$("#result").html(result);
	   		},
	   		error : function(data)
	   		{
	   		 $(".showbox").stop(true).animate({ 'margin-top': '250px', 'opacity': '0' }, 0); $(".overlay").css({ 'display': 'none', 'opacity': '0' });
	   			$("#template").html("暂无信息");
	   		//	$.dialog.alert(data.statusText, function(){window.location.reload(); return true;});
	   		}
   		});
   }
   
    $(function(){
  	    $(".per_name").click(function(e){
		    var parent = $(this).parent().parent().parent()
		    if( e && e.stopPropagation)e.stopPropagation()
		    if( e && e.preventDefault )e.preventDefault()
		    if(parent.hasClass("hover")){
			    parent.removeClass("hover")
		    }else{
			    parent.addClass("hover")
			    var hideTip = function(){
				    parent.removeClass("hover")
				    $(document).off("click",hideTip)
			    }
			    $(document).on("click",hideTip)
		    }
	    })	
	})
  </script>		

<script type="text/javascript" src="/visit/js/purl.js"></script>
<script type="text/javascript">
document.documentElement.style.webkitUserSelect='none';
document.documentElement.style.webkitTouchCallout='none';
if("Y"=='<%=copyFlag%>')
{
	$("#rstDiv").css("display", "block");
}else if("N"=='<%=copyFlag%>')
{
	$("#checkDiv").css("display", "block");
}

$(".btn_submit").click(function()
{
	window.javatojs.visitTalk();	
});

function showImg(imgUrl)
{
	window.javatojs.showImg(imgUrl);	
}
</script>