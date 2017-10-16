
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/demo/demo.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/icon.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
		<script src="<%= basePath %>js/jquery-1.7.2.min.js"></script>
		<script src="<%= basePath %>js/list.js"></script>
		<jsp:include page="02.jsp"></jsp:include>
<title>艾西湖</title>
<style>
	body{
	background-color:#b7d2ff;
	text-align:center;
	}
</style>
</head>

<body>
 <h2>最新结果</h2>
	<div class="page-content">
			<form action=" #" id="mainForm" method="post">
				<table style="width:856px;height:auto;text-align:center;">
					<tbody>
						<tr>
							<td width='20%' align="right">最新的温、气、压</td>
							<td width="25%" align="right">温度：</td>
							<td>${tps.temperature}</td>
							<td width="25%" align="right">气压：</td>
							<td>${tps.pressure}</td>
							<td width="30%" align="right">湿度：</td>
							<td>${tps.humidity}</td>
						</tr>
					</tbody>
				</table>
			</form>
	 </div>
	 <form action="<%=request.getContextPath()%>/servlet/Pointservlet" method="post">
		 <table title="详细数据" class="easyui-datagrid" style="width:100%;height:auto">
		 	<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'productid',width:'8.4%',align:'center'">点名</th>
					<th data-options="field:'listprice',width:'13%',align:'center'">东坐标</th>
					<th data-options="field:'listprice',width:'13%',align:'center'">西坐标</th>
					<th data-options="field:'listprice',width:'13%',align:'center'">高程</th>
					<th data-options="field:'listprice',width:'13%',align:'center'">东方向位移</th>
					<th data-options="field:'listprice',width:'13%',align:'center'">北方向位移</th>
					<th data-options="field:'listprice',width:'13%',align:'center'">高程位移</th>
					<th data-options="field:'listprice',width:'13%',align:'center'">观测时间</th>
				</tr>
			</thead>
		<%-- 	<c:forEach items="${tppage}" var="ts" varStatus="status"> --%>
					<tr>
						<td><input type="checkbox"  name="id" value="${result.id}"/></td>
						<td>${result.name}</td>
						<td>${result.easting}</td>
						<td>${result.northing}</td>
						<td>${result.height}</td>
						<td>${result.eastingDiff}</td>
						<td>${result.northingDiff}</td>
						<td>${result.heightDiff}</td>
						<td>${result.epoch}</td>
					</tr>
				<%-- </c:forEach> --%>
			</tbody>
	    </table>
	 </form>
	
</body>
</html>