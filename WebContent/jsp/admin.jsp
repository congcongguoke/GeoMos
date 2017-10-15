<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>艾西湖</title>
</head>
<frameset rows="150,*,93" cols="*" framespacing="0" frameborder="no" border="0">
 <frame src="<%=request.getContextPath()%>/jsp/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame"  marginwidth="0" marginheight="0"  frameborder="0" />
 <%-- <frameset cols="260,*" id="frame">
	<frame src="<%=request.getContextPath()%>/jsp/left.jsp" name="leftFrame" noresize="noresize" marginwidth="110px" marginheight="0" frameborder="0" scrolling="auto" target="main"  />
	<frame src="<%=request.getContextPath()%>/jsp/01.jsp" name="main" marginwidth="50px" marginheight="40px" frameborder="0" scrolling="auto" target="_self"  />
    </frameset> --%>
 <frame src="<%=request.getContextPath()%>/jsp/02.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" marginwidth="0" marginheight="0"/>
</frameset><noframes></noframes>
</html>