<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>艾西湖</title>
  
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/icon.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
</head>

 <body class="easyui-layout" >

		<div data-options="region:'north',border:false" style="padding:10px">
			<jsp:include page="top.jsp"></jsp:include>
		  </div>
		  
		<div data-options="region:'south',border:false" style="height:45px;padding:10px"> 
		   <jsp:include page="02.jsp"></jsp:include>
		  		 </div>
		 
		 <div data-options="region:'west',split:true" title="目录"  style="width:240px;padding:10px">
		    <jsp:include page="left.jsp"></jsp:include>
		</div> 
		
		<div data-options="region:'center',title:'检测数据'">
			<jsp:include page="01.jsp"></jsp:include>
		</div>
</body> 
</html>