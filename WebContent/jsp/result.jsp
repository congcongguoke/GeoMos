
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
<jsp:include page="02.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/icon.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
   		h2{
    		text-align:center;}
    	body{
    		background-color:#b7d2ff;}
     </style>
<meta http-equiv="refresh" content="2;url=<%=request.getContextPath()%>/servlet/resultsindex?pointid=${result.pointid}&action=sel">
<title>艾西湖</title>
</head>
<%-- <body>
	<div class="page-content">
		<div class="content-nav">最新结果</div>
		<form action=" #" id="mainForm" method="post">

			<div class="right">
				<div class="rightCont">
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">最新的温、气、压：</td>
								<td width="90" align="right">温度：</td>
								<td>${tps.temperature}</td>
								<td width="90" align="right">气压：</td>
								<td>${tps.pressure}</td>
								<td width="90" align="right">湿度：</td>
								<td>${tps.humidity}</td>
							</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
									<th><input type="checkbox" id="all" onclick="#" /></th>
									<th>点名</th>
									<th>东坐标</th>
									<th>北坐标</th>
									<th>高程</th>
									<th>东方向位移</th>
									<th>北方向位移</th>
									<th>高程位移</th>
									<th>观测时间</th>
								</tr>

								<tr>
									<td><input type="checkbox" name="id" value="${result.id}" /></td>
									<td>${result.name}</td>
									<td>${result.easting}</td>
									<td>${result.northing}</td>
									<td>${result.height}</td>
									<td>${result.eastingDiff}</td>
									<td>${result.northingDiff}</td>
									<td>${result.heightDiff}</td>
									<td>${result.epoch}</td>
								</tr>

							</tbody>
						</table>

					</div>
				</div>
			</div>
		</form>
	</div>
</body> --%>
<body >
	<h2>最新结果</h2>
	<div style="margin:20px 0;"></div>
	<form action=" #" id="mainForm" method="post">
		 <table title="详细数据" class="easyui-datagrid" style="width:100%;height:auto">
		<!-- <thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'productid',width:'50%',align:'center'">点名</th>
				<th data-options="field:'listprice',width:'49.5%',align:'center'">创建时间</th>
			</tr>
		</thead> -->
			<tbody>
				<tr>
					<td><input type="checkbox" id="all" onclick="#" /></td>
					<td>点名</td>
					<th>东坐标</th>
					<th>北坐标</th>
					<th>高程</th>
					<th>东方向位移</th>
					<th>北方向位移</th>
					<th>高程位移</th>
					<th>观测时间</th>
				</tr>
				<tr>
					<td><input type="checkbox" name="id" value="${result.id}" /></td>
					<td>${result.name}</td>
					<td>${result.easting}</td>
					<td>${result.northing}</td>
					<td>${result.height}</td>
					<td>${result.eastingDiff}</td>
					<td>${result.northingDiff}</td>
					<td>${result.heightDiff}</td>
					<td>${result.epoch}</td>
				</tr>
			</tbody>
		</table>
   </form>
</body>
</html>