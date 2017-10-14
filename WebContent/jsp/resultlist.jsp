
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
		<script src="<%= basePath %>js/list.js"></script>
		<script language="javascript" type="text/javascript"
	src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<title>艾西湖</title>
</head>
<body >
<div class="page-content">
<div class="content-nav">所有位移结果</div>
		<form action="<%=request.getContextPath()%>/servlet/Resultsservlet" id="mainForm" method="post">
			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/>
			
			<div class="right">
				
				<div class="rightCont">
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">观测时间：</td>
								<td><input class="Wdate" type="text" id="epoch" name="epoch"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
								  <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th><input type="checkbox" id="all" onclick="#"/></th>
								 
								    <th>点名</th>
								    <th>东坐标</th>
								    <th>北坐标</th>
								    <th>高程</th>
								    <th>东方向位移</th>
								    <th>北方向位移</th>
								    <th>高程位移</th>
								    <th>观测时间</th>
								</tr>
								<c:forEach items="${rspage}" var="result" varStatus="status">
									<tr >
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
								</c:forEach>
							</tbody>
						</table>
						<div class='page fix'>
							共 <b>${page.totalNumber}</b> 条
							<c:if test="${page.currentPage != 1}">
								<a href="javascript:changeCurrentPage('1')" class='first'>首页</a>
								<a href="javascript:changeCurrentPage('${page.currentPage-1}')" class='pre'>上一页</a>
							</c:if>
							当前第<span>${page.currentPage}/${page.totalPage}</span>页
							<c:if test="${page.currentPage != page.totalPage}">
								<a href="javascript:changeCurrentPage('${page.currentPage+1}')" class='next'>下一页</a>
								<a href="javascript:changeCurrentPage('${page.totalPage}')" class='last'>末页</a>
							</c:if>
							跳至&nbsp;<input id="currentPageText" type='text' value='${page.currentPage}' class='allInput w28' />&nbsp;页&nbsp;
							<a href="javascript:changeCurrentPage($('#currentPageText').val())" class='go'>GO</a>
						</div>
					</div>
				</div>
			</div>
	    </form>
	    </div>
	</body>
</html>