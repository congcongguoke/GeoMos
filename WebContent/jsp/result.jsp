
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
		<script src="<%= basePath %>js/echarts.min.js"></script>
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
	 <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
        	    title: {
        	        text: '一周位移变化',
        	    },
        	    tooltip: {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data:['东位移','北位移','高程位移']
        	    },
        	    toolbox: {
        	        show: true,
        	        feature: {
        	            dataZoom: {
        	                yAxisIndex: 'none'
        	            },
        	            dataView: {readOnly: false},
        	            magicType: {type: ['line', 'bar']},
        	            restore: {},
        	            saveAsImage: {}
        	        }
        	    },
        	    xAxis:  {
        	        type: 'category',
        	        boundaryGap: false,
        	        data: ['周一','周二','周三','周四','周五','周六','周日']
        	    },
        	    yAxis: {
        	        type: 'value',
        	        axisLabel: {
        	            formatter: '{value}'
        	        }
        	    },
        	    series: [
        	        {
        	            name:'东位移',
        	            type:'line',
        	            data:[11, 11, 15, 13, 12, 13, 10],
        	            markPoint: {
        	                data: [
        	                    {type: 'max', name: '最大值'},
        	                    {type: 'min', name: '最小值'}
        	                ]
        	            },
        	            markLine: {
        	                data: [
        	                    {type: 'average', name: '平均值'}
        	                ]
        	            }
        	        },
        	        {
        	            name:'北位移',
        	            type:'line',
        	            data:[11, 10, 15, 13, 12, 13, 10],
        	            markPoint: {
        	                data: [
        	                    {type: 'max', name: '最大值'},
        	                    {type: 'min', name: '最小值'}
        	                ]
        	            },
        	            markLine: {
        	                data: [
        	                    {type: 'average', name: '平均值'}
        	                ]
        	            }
        	        },
        	        {
        	            name:'高程位移',
        	            type:'line',
        	            data:[11, 10, 11, 8, 12, 10, 10],
        	            markPoint: {
        	                data: [
        	                    {type: 'max', name: '最大值'},
        	                    {type: 'min', name: '最小值'}
        	                ]
        	            },
        	            markLine: {
        	                data: [
        	                    {type: 'average', name: '平均值'}
        	                ]
        	            }
        	        }
        	       /*  {
        	            name:'最低气温',
        	            type:'line',
        	            data:[1, -2, 2, 5, 3, 2, 0],
        	            markPoint: {
        	                data: [
        	                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
        	                ]
        	            },
        	            markLine: {
        	                data: [
        	                    {type: 'average', name: '平均值'},
        	                    [{
        	                        symbol: 'none',
        	                        x: '90%',
        	                        yAxis: 'max'
        	                    }, {
        	                        symbol: 'circle',
        	                        label: {
        	                            normal: {
        	                                position: 'start',
        	                                formatter: '最大值'
        	                            }
        	                        },
        	                        type: 'max',
        	                        name: '最高点'
        	                    }]
        	                ]
        	            }
        	        } */
        	    ]
        	};

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
	
</body>
</html>