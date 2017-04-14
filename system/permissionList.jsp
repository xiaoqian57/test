<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>通元内容管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
</head>

<%  // Title of this page and breadcrumbs
    String title = "权限主页";
    String[][] breadcrumbs = null;
    String[][] operations = null;

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="permissions" requestURI="permissionList.do" id="permission">
  <table:column property="name" title="权限名" />
  <table:column property="description" title="描述" />
</table:table>

</div>

</html>
