
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common03.css" />
<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<meta http-equiv="refresh" content="2;url=<%=request.getContextPath()%>/servlet/resultsindex?pointid=${result.pointid}&action=sel">
<title>艾西湖</title>
</head>
<body>
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
</body>
</html>