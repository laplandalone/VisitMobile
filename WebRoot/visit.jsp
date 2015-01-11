<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String visitId = request.getParameter("visitId");
	String copyFlag = request.getParameter("copyFlag");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /><meta name="apple-mobile-web-app-capable" content="yes" /><meta name="apple-mobile-web-app-status-bar-style" content="black" /><meta name="format-detection" content="telephone=yes" /><meta name="format-detection" content="email=no" /><title>
	 
</title><link rel="stylesheet" type="text/css" href="../css/css.css" /><meta content="手机找工作,台州人力网手机版,触屏版,求职,找工作,招聘" name="keywords" />

    <script type="text/javascript" src="../js/jquery.js"></script>

</head>
<body>
    <div class="tzrl_box">
     
        <div class="mq_box">
           
            <div class="mq_con_list">
                <ul>
	                <div id="template"/>
	             
                </ul>
            </div>
        </div>
       
        
   <script type="text/javascript" src="/visit/js/DeleteSession.js"></script>
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
   		//	dig = new $.dialog({title:'正在查询请等待...',esc:false,min:false,max:false,lock:true});
   		},
   		success : function(data)
   		{
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
   				content+="<li><dl class='mq_word'>";
   				i=i+1;
   	   			content+="<dd>"+i+"、"+obj.codeFlagVal+"</dd><dd>"+obj.codeValFlag+"</dd>";
   	   			content+="</dl></li>";
   			});
   			
   			$("#template").html(content);
 
   		},
   		error : function(data)
   		{
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
$(function(){
        $("#selectTest").change(function(){
             location.href="Default.aspx@pageindex="+$("#selectTest").val()+"";
        });
       
    if($.url().param('flag')){
        if($.url(document.URL).param('flag')=='1'){
             $(".mq_menu ul li").removeClass("mq_default");
             $(".mq_menu ul li").eq(0).addClass("mq_default");
        }
        else if($.url(document.URL).param('flag')=='2'){
             $(".mq_menu ul li").removeClass("mq_default");
             $(".mq_menu ul li").eq(2).addClass("mq_default");
        }
        else if($.url(document.URL).param('flag')=='3'){
             $(".mq_menu ul li").removeClass("mq_default");
             $(".mq_menu ul li").eq(1).addClass("mq_default");
        }
    }
   
    $(".mq_menu ul li").click(function(){
           location.href="default.aspx@flag="+$(this).data('id')+"";
        });
});

    </script>
     <div class="log_box">
 		 <li class="btn_submit">
                    <button id="submitType" name="submitType" type="submit">诊断</button>
         </li>
     </div>
</body>
</html>
<script type="text/javascript">
document.documentElement.style.webkitUserSelect='none';
document.documentElement.style.webkitTouchCallout='none';
if("Y"=='<%=copyFlag%>')
{
	document.getElementById("submitType").innerHTML="诊断结果"; 
}

$(".btn_submit").click(function()
{

	window.javatojs.visitTalk();	
});
</script>