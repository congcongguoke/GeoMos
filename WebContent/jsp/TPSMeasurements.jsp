
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
	<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/common03.css" /> --%>

		<script src="<%= basePath %>js/jquery-1.7.2.min.js"></script>
		<script src="<%= basePath %>js/list.js"></script>
<title>艾西湖</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5.3/demo.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>

</head>
<body style="background-color:#b7d2ff;text-align:center;">
<h2>温度气压表</h2>
<div class="easyui-panel" style="width:100%;">
		<table class="tab1">
			<tbody>
				<tr>
					<td>	<div id="tb" style="padding:2px 5px;">点名:
		<select class="easyui-combobox" panelHeight="auto" style="width:120px">
			<option value="">请选择监测站点</option>
			<c:forEach var="dept" items="${ps}">
				<option value="${dept.id}">${dept.name}</option>
			</c:forEach>
		</select>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	</div></td>
				</tr>
			</tbody>
		</table>
	</div>	
	<table id="dg" title="详细数据" style="width:100%;height:350px" data-options="
				rownumbers:true,
				singleSelect:true,
				autoRowHeight:false,
				pagination:true,
				pageSize:10">
		<thead>
			<tr>
				<th field="checkbox" width="40"><input type="checkbox" id="all" onclick="#"/></th>
				<th field="inv" width="100">点名</th>
				<th field="date" width="150">更新时间</th>
				<th field="name" width="120">温度</th>
				<th field="amount" width="120">气压</th>
				<th field="price" width="120">湿度</th>
				<c:forEach items="${tppage}" var="ts" varStatus="status">
					<tr>
						<td><input type="checkbox"  name="id" value="${ts.pointid}"/></td>
						<td>${ts.name}</td>
						<td>${ts.epoch}</td>
						<td>${ts.temperature}</td>
						<td>${ts.pressure}</td>
						<td>${ts.humidity}</td>
					</tr>
				</c:forEach>
			</tr>
		</thead>
	</table>
<div style="bottom:0px;align:center;">ViniBuild Copyright©2017</div>
<script>
		(function($){
			function pagerFilter(data){
				if ($.isArray(data)){	// is array
					data = {
						total: data.length,
						rows: data
					}
				}
				var target = this;
				var dg = $(target);
				var state = dg.data('datagrid');
				var opts = dg.datagrid('options');
				if (!state.allRows){
					state.allRows = (data.rows);
				}
				if (!opts.remoteSort && opts.sortName){
					var names = opts.sortName.split(',');
					var orders = opts.sortOrder.split(',');
					state.allRows.sort(function(r1,r2){
						var r = 0;
						for(var i=0; i<names.length; i++){
							var sn = names[i];
							var so = orders[i];
							var col = $(target).datagrid('getColumnOption', sn);
							var sortFunc = col.sorter || function(a,b){
								return a==b ? 0 : (a>b?1:-1);
							};
							r = sortFunc(r1[sn], r2[sn]) * (so=='asc'?1:-1);
							if (r != 0){
								return r;
							}
						}
						return r;
					});
				}
				var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
				var end = start + parseInt(opts.pageSize);
				data.rows = state.allRows.slice(start, end);
				return data;
			}

			var loadDataMethod = $.fn.datagrid.methods.loadData;
			var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
			$.extend($.fn.datagrid.methods, {
				clientPaging: function(jq){
					return jq.each(function(){
						var dg = $(this);
                        var state = dg.data('datagrid');
                        var opts = state.options;
                        opts.loadFilter = pagerFilter;
                        var onBeforeLoad = opts.onBeforeLoad;
                        opts.onBeforeLoad = function(param){
                            state.allRows = null;
                            return onBeforeLoad.call(this, param);
                        }
                        var pager = dg.datagrid('getPager');
						pager.pagination({
							onSelectPage:function(pageNum, pageSize){
								opts.pageNumber = pageNum;
								opts.pageSize = pageSize;
								pager.pagination('refresh',{
									pageNumber:pageNum,
									pageSize:pageSize
								});
								dg.datagrid('loadData',state.allRows);
							}
						});
                        $(this).datagrid('loadData', state.data);
                        if (opts.url){
                        	$(this).datagrid('reload');
                        }
					});
				},
                loadData: function(jq, data){
                    jq.each(function(){
                        $(this).data('datagrid').allRows = null;
                    });
                    return loadDataMethod.call($.fn.datagrid.methods, jq, data);
                },
                deleteRow: function(jq, index){
                	return jq.each(function(){
                		var row = $(this).datagrid('getRows')[index];
                		deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                		var state = $(this).data('datagrid');
                		if (state.options.loadFilter == pagerFilter){
                			for(var i=0; i<state.allRows.length; i++){
                				if (state.allRows[i] == row){
                					state.allRows.splice(i,1);
                					break;
                				}
                			}
                			$(this).datagrid('loadData', state.allRows);
                		}
                	});
                },
                getAllRows: function(jq){
                	return jq.data('datagrid').allRows;
                }
			})
		})(jQuery);

		 function getData(){
			var rows = [];
			
			return rows;
		} 
		
		$(function(){
			$('#dg').datagrid({data:getData()}).datagrid('clientPaging');
		});
	</script>

<%-- <div class="page-content">
<div class="content-nav">温度气压表</div>
		<form action="<%=request.getContextPath()%>/servlet/TPSMeasurementsservlet" id="mainForm" method="post">
			<input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/>
			
			<div class="right">
				
				<div class="rightCont">
				
				<table class="tab1">
						<tbody>
							<tr>
								
								<td width="90" align="right">点名：</td>
								<td>
									<div id="divfrom">
								<select id="pointid" name="pointid">
								  <option value="">请选择监测站名</option>
									<c:forEach var="dept" items="${ps}">
										<option value="${dept.id}">${dept.name}</option>
									</c:forEach>
								</select> 
							</div>
								</td>
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
								    <th>更新时间</th>
								    <th>温度</th>
								    <th>气压</th>
								    <th>湿度 </th>
								</tr>
								<c:forEach items="${tppage}" var="ts" varStatus="status">
									<tr>
										<td><input type="checkbox"  name="id" value="${ts.pointid}"/></td>
										<td>${ts.name}</td>
										<td>${ts.epoch}</td>
										<td>${ts.temperature}</td>
										<td>${ts.pressure}</td>
								          <td>${ts.humidity}</td>
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
	    </div> --%>
	</body>
</html>