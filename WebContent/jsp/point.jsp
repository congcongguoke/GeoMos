
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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/icon.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
    	#footer{
    		position:fixed; 
			bottom:0;
			width:100%;}
    	#footer p{
    		text-align:center;}
   		h2{
    		text-align:center;}
    	body{
    		background-color:#b7d2ff;}
     </style>
	 <title>艾溪湖</title>
</head>
<body >
	<h2>所有监测点</h2>
	<div style="margin:20px 0;"></div>
	<form action="<%=request.getContextPath()%>/servlet/Pointservlet" id="mainForm" method="post">
		<table id="dg" class="easyui-datagrid" title="监测点详细信息"
			data-options="rownumbers:true,singleSelect:true,method:'post'">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'productid',width:100">点名</th>
					<th data-options="field:'listprice',width:80,align:'right'">时间</th>
				</tr>
						
				<c:forEach items="${pspage}" var="point" varStatus="status">
				<tr>
					<td><input type="checkbox"  name="id" value="${point.id}"/></td>
					<td>${point.name}</td>
					<td>${point.epoch}</td>
				</tr>
	   	   		</c:forEach>
		   </thead>				
	  </table>
   </form>
   <div id = "footer">
   		<p>ViniBuild Copyright©2017</p>
   </div>
</body>
</html>