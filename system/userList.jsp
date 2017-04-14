<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>通元内容管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
</head>

<%  // Title of this page and breadcrumbs
    String title = "用户主页";
    String[][] breadcrumbs = null;
    String[][] operations = new String[][] {
            {"<img src='../images/new.gif' border=0>&nbsp;新建", "user.do?cmd=new" }
        };

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="users" requestURI="userList.do" id="user">
  <table:column property="name" title="用户名" sortable="true" href="user.do" paramId="username" paramProperty="name"/>
  <table:column property="fullName" title="姓名" sortable="true"/>
  <table:column property="email" autolink="true" title="电子邮件" />
  <table:column title="编辑" align="center" >
      <html:link page="/system/user.do?cmd=edit" paramName="user" paramId="username" paramProperty="name">
           <html:img page="/images/edit.gif" altKey="button.edit" border="0" align="bottom"/>
      </html:link>
  </table:column>
  <table:column title="删除" align="center" >
      <logic:notEqual name="user" property="name" value="admin">
          <html:link page="/system/user.do?cmd=remove" paramName="user" paramId="username" paramProperty="name">
          	<html:img page="/images/delete.gif" altKey="button.delete" border="0" align="bottom" onclick="return confirmDelete()"/>
          </html:link>
      </logic:notEqual>
  </table:column>
</table:table>

</div>

<script type="text/javascript">
  function confirmDelete() {
    var msg = '<bean:message key="confirm.delete"/>';
    return confirm(msg);
  }
</script>

</html>
