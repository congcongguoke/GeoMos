
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common03.css" />
		<script src="<%= basePath %>js/jquery-1.7.2.min.js"></script>

<title>艾西湖</title>
</head>
<body >
<div class="page-content">
	<div class="content-nav">所有监测点 </div>
		<form action="<%=request.getContextPath()%>/servlet/Pointservlet" id="mainForm" method="post">
			
			
			<div class="right">
			
				<div class="rightCont">
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th><input type="checkbox" id="all" onclick="#"/></th>
								    <th>点名</th>
								    <th>创建时间</th>
								 
								</tr>
								<c:forEach items="${pspage}" var="point" varStatus="status">
									<tr>
										<td><input type="checkbox"  name="id" value="${point.id}"/></td>
										<td>${point.name}</td>
										<td>${point.epoch}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
	    </form>
	    </div>
	</body>
</html>