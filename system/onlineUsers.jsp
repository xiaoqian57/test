<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>ͨԪ���ݹ���</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
</head>

<%  // Title of this page and breadcrumbs
    String title = "�����û�";
    String[][] breadcrumbs = null;
    String[][] operations = null;

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="users" requestURI="onlineUsers.do" id="user">
  <table:column property="name" title="�û���" href="user.do" paramId="username" paramProperty="name"/>
  <table:column property="fullName" title="����" sortable="true"/>
  <table:column property="email" autolink="true" title="�����ʼ�" />
</table:table>

</div>

</html>
