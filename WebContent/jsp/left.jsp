<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<style type="text/css">
     .tree li{
     	margin:8px 0;
     }
     .tree-title{font-size:18px;font-family: 微软雅黑;margin:0px 0px 20px 0px;}
     a:link{text-decoration: none; color:blue; font-size: 16px; font-family: 微软雅黑;}
     a:visited{ color:#09f;}
     a:hover{text-decoration: underline; color:rgb(42, 29, 223); font-size: 16px;}
     a:active{text-decoration: blink; color:rgb(193, 68, 106) ;}
     </style>
</head>

	 <div style="margin: 20px 0;"></div>
	 <div style="padding:5px">
	   <ul class="easyui-tree">
	   
	   	<li class="tree-title"><span >系统概述</span></li>
	   	
	   	
	   <li class="tree-title"><span>所有监测站的数据结果</span>
			<ul class="sidebar-menu">
			<c:forEach items="${ps}" var="ps" varStatus="status">
				<li class="sidebar-menuitem active">
				<a href="<%=request.getContextPath()%>/servlet/resultsindex?pointid=${ps.id }&action=sel" target="main">${ps.name }
				
				</a></li>
				  </c:forEach>
			</ul>
	    
	   </li>
	   
		<li class="tree-title"><span >监测站点</span>
		
			<ul class="sidebar-menu">
				<li class="sidebar-menuitem">
				<a href="<%=request.getContextPath()%>/servlet/Pointservlet"
					target="main">监测站点搜索</a></li>
				<li class="sidebar-menuitem"><a
					href="<%=request.getContextPath()%>/servlet/Resultsservlet"
					target="main">监测数据搜索</a></li>
				<li class="sidebar-menuitem"><a
					href="<%=request.getContextPath()%>/servlet/Coordinatesservlet"
					target="main">监测站点初始坐标</a></li>
			</ul>
		</li>
			
			
		<li class="tree-title"><span>温度气压管理</span>
			<ul class="sidebar-menu">
				<li class="sidebar-menuitem"><a
					href="<%=request.getContextPath()%>/servlet/TPSMeasurementsservlet"
					target="main">温度气压搜索</a></li>
			</ul>
		</li>
		<li class="tree-title"><span >阈值警报</span></li>
	</ul>
	</div>

	

