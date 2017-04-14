<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>通元内容管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
</head>

<%  // Title of this page and breadcrumbs
    String title = "在线用户";
    String[][] breadcrumbs = null;
    String[][] operations = null;

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="users" requestURI="onlineUsers.do" id="user">
  <table:column property="name" title="用户名" href="user.do" paramId="username" paramProperty="name"/>
  <table:column property="fullName" title="姓名" sortable="true"/>
  <table:column property="email" autolink="true" title="电子邮件" />
</table:table>

</div>

</html>
