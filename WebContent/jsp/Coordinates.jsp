
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
 	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()
		+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="02.jsp"></jsp:include>
		 <script src="<%= basePath %>js/jquery-1.7.2.min.js"></script>
		<script src="<%= basePath %>js/list.js"></script>
      

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
			width:100%;
    		}
   	 #footer p{
   			text-align:center;
    		}
	</style>
	
	 <title>艾溪湖</title>
</head>
<body style="background-color:#b7d2ff;text-align:center;">
<h2 align="center"> 监测点的初始坐标</h2>

<div style="margin:20px 0;"></div>
		<form action="<%=request.getContextPath()%>/servlet/Coordinatesservlet" id="mainForm" method="post">
			<%-- <input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/> --%>
			 
			   <table id="dg" title="详细数据"  class="easyui-datagrid" style="width:100%;height:auto"
			data-options="
			rownumbers:'true',
			singleSelect:'true',
			pagination:'true',
			autoRowHeight:'false',
			pageSize:'10'
			"> 
			
		
							<thead>
								<tr>
								    <th data-options="field:'ck',checkbox:true"></th>
									<th data-options="field:'itemid',width:'20%',align:'center'">点名</th>
									<th data-options="field:'productid',width:'20%',align:'center'">初始坐标更新时间</th>
									<th data-options="field:'listprice',width:'20%',align:'center'">东坐标</th>
									<th data-options="field:'unitcost',width:'20%',align:'center'">北坐标</th>
									<th data-options="field:'attr1',width:'19%',align:'center'">高程</th>
					
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cspage}" var="coordinates" varStatus="status">
									<tr>
										<td><input type="checkbox"  name="id" value="${coordinates.pointid}"/></td>
										<td>${coordinates.name}</td>
										<td>${coordinates.epoch}</td>
										<td>${coordinates.easting}</td>
										<td>${coordinates.northing}</td>
								        <td>${coordinates.height}</td>
									</tr>
								</c:forEach>
						   </tbody>
						</table>
				</form>	
		<script type="text/javascript">
		$(function(){
			var pager = $('#dg').datagrid('getPager');	// get the pager of datagrid		
		})
	</script>
	
	    
	  <div id = "footer">
     	<p>ViniBuild Copyright©2017</p>
      </div>
   
  	 

	</body>
</html>