<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>ͨԪ���ݹ���</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
</head>

<%  // Title of this page and breadcrumbs
    String title = "Ȩ����ҳ";
    String[][] breadcrumbs = null;
    String[][] operations = null;

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="permissions" requestURI="permissionList.do" id="permission">
  <table:column property="name" title="Ȩ����" />
  <table:column property="description" title="����" />
</table:table>

</div>

</html>
