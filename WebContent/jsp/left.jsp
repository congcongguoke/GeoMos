<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>艾西湖</title>
 
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common02.css"/> --%>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.3/demo.css">
	<script type="text/javascript" src="../jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="../jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	
</head>
<body>
<ul class="easyui-tree">
		<li>
			<span>所有监测站的数据结果</span>
			<ul>
				<li data-options="state:'closed'">
					<span>监测站点</span>
					<ul>
						<li>
							<span><a href="<%=request.getContextPath()%>/servlet/Pointservlet" target="main">监测站点搜索</a></span>
						</li>
						<li>
							<span>Wife</span>
						</li>
						<li>
							<span>Company</span>
						</li>
					</ul>
				</li>
				<li>
					<span>Program Files</span>
					<ul>
						<li>Intel</li>
						<li>Java</li>
						<li>Microsoft Office</li>
						<li>Games</li>
					</ul>
				</li>
				<li>index.html</li>
				<li>about.html</li>
				<li>welcome.html</li>
			</ul>
		</li>
	</ul>



	
        <%--  <!--  <div class="page-sidebar" >
                <div class="sidebar-menugroup">
                    <div class="sidebar-grouptitle">所有监测站的数据结果</div>
                    <ul class="sidebar-menu">
                    <c:forEach items="${ps}" var="ps" varStatus="status">
                        <li class="sidebar-menuitem active"><a href="<%=request.getContextPath()%>/servlet/resultsindex?pointid=${ps.id}&action=sel" target="main">${ps.name}</a></li>
                      	</c:forEach>
                    </ul>
                </div>
                
                <div class="sidebar-menugroup">
                    <div class="sidebar-grouptitle">监测站点</div>
                    <ul class="sidebar-menu">
            
                        <li class="sidebar-menuitem"><a href="<%=request.getContextPath()%>/servlet/Pointservlet" target="main">监测站点搜索</a></li>
                        <li class="sidebar-menuitem"><a href="<%=request.getContextPath()%>/servlet/Resultsservlet" target="main" >监测数据搜索</a></li>
                         <li class="sidebar-menuitem"><a href="<%=request.getContextPath()%>/servlet/Coordinatesservlet" target="main" >监测站点初始坐标</a></li>
                    </ul>
                </div>
                  
                <div class="sidebar-menugroup">
                    <div class="sidebar-grouptitle">温度气压管理</div>
                    <ul class="sidebar-menu">
                        <li class="sidebar-menuitem"><a href="<%=request.getContextPath()%>/servlet/TPSMeasurementsservlet" target="main">温度气压搜索</a></li>        
                    </ul>
                </div>
                </div> --> --%>
</body>
</html>
