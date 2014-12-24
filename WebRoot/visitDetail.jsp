<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
  		<title></title>
  	</head>
  
  	<body>
  		<div style="width: 100%; height: 100%;">
	  		<table width='100%' border='0' cellspacing='0' cellpadding='0' style="margin-top: 20px;" align="center">
	  			<tr>
	  				<td align="right" width="10%">随访名称：</td>
	  				<td width="15%">
	  					<c:choose>
	  						<c:when test="${obj.visitType == 'asd' }">
	  							<c:out value="先心手术随访"></c:out>
	  						</c:when>
	  						<c:when test="${obj.visitType == 'mvr' }">
	  							<c:out value="房颤手术随访"></c:out>
	  						</c:when>
	  						<c:when test="${obj.visitType == 'gxb' }">
	  							<c:out value="冠心病手术随访"></c:out>
	  						</c:when>
	  					</c:choose>
	  				</td>
	  				<td align="right" width="10%">随访姓名：</td>
	  				<td width="15%">${obj.visitName }</td>
	  				<td align="right" width="10%">性别：</td>
	  				<td width="15%">
	  					<c:choose>
	  						<c:when test="${obj.sex == null || obj.sex == '' || obj.sex == 'null' }">
	  							<c:out value="无"></c:out>
	  						</c:when>
	  						<c:otherwise>
	  							<c:out value="${obj.sex }"></c:out>
	  						</c:otherwise>
	  					</c:choose>
	  				</td>
	  			</tr>
	  		</table>
	  		<table id='table1' width='100%' border='1' cellspacing='0' cellpadding='0'>
	  			<c:forEach items="${array }" var="lst" varStatus="i">
	  				<tr>
	  					<td width="70%" align="right">${lst.codeFlagVal }&nbsp;</td>
	  					<td width="30%" align="left">&nbsp;${lst.codeValFlag }</td>
	  				</tr>
	  			</c:forEach>
	  		</table>
  		</div>
  	</body>
</html>