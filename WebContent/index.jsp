<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <meta http-equiv="refresh" content="0;url=<%=request.getContextPath() %>/servlet/resultsindex?action=pointname">

<title>艾西湖</title> -->
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.5.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<h2>Accordion Actions</h2>
	<p>Click the buttons below to add or remove accordion items.</p>
	<div style="margin:20px 0 10px 0;">

		<!--设置链接按钮  ：选择窗口，添加窗口，移除窗口-->
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="selectPanel()">Select</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addPanel()">Add</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="removePanel()">Remove</a>
	</div>

	 <!-- easyui-accordion 表示可折叠类型 -->
	<div id="aa" class="easyui-accordion" style="width:400px;height:400px;">
		<div title="About" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			<h3 style="color:#0099FF;">Accordion for jQuery</h3>
			<p>Accordion is a part of easyui framework for jQuery. It lets you define your accordion component on web page more easily.</p>
		</div>
	</div>
	<script type="text/javascript">
		function selectPanel(){
			// 弹出提示框 标题为 Prompt 内容为“please ...” 
			$.messager.prompt('Prompt','Please enter the panel title:',function(s){
				if (s){
					$('#aa').accordion('select',s);
				}
			});
		}
		var idx = 1;
		function addPanel(){
			$('#aa').accordion('add',{
				title:'Title'+idx,
				content:'<div style="padding:10px">Content'+idx+'</div>'
			});
			idx++;
		}
		function removePanel(){
			var pp = $('#aa').accordion('getSelected');
			if (pp){
				var index = $('#aa').accordion('getPanelIndex',pp);
				$('#aa').accordion('remove',index);
			}
		}
	</script>
</body>
</html>