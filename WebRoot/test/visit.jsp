<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> </title>
<link href="css/indexnew.css" rel="stylesheet" type="text/css">
<link href="css/shouye.css" rel="stylesheet" type="text/css">
  
</head>
<body>
<!-- 头部 -->
<div id="main_body">
<section class="s_m517">
<div class="h">
	<b><c:choose>
		<c:when test="${obj.visitType == 'asd' }">
			<c:out value="先心手术随访"></c:out>
		</c:when>
		<c:when test="${obj.visitType == 'mvr' }">
			<c:out value="房颤手术随访"></c:out>
		</c:when>
		<c:when test="${obj.visitType == 'gxb' }">
			<c:out value="冠心病手术随访"></c:out>
		</c:when>
		<c:when test="${obj.visitType == 'asdChild' }">
			<c:out value="儿童先心手术随访"></c:out>
		</c:when>
		<c:when test="${obj.visitType == 'asdAdult' }">
			<c:out value="成人先心手术随访"></c:out>
		</c:when>
	</c:choose></b>|<span>${obj.visitName }</span>  
</div>
   
      <ul class="box01_list">
	      <li class="li_list">
		    	<div>
		    		<c:forEach items="${array }" var="lst" varStatus="i">
		  					<a href="#">${lst.codeFlagVal }&nbsp;&nbsp; <b>${lst.codeValFlag }</b> </a>
		  			</c:forEach>
		    	</div>
			</li>
	 	</ul>
</section>

<div style="padding: 15px 15px 0 15px; border-top: 1px solid #CFCFCF;">合作伙伴:益健康</div>
</br>



 
</body>
</html>
