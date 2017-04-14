<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>通元内容管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
</head>

<%  // Title of this page and breadcrumbs
    String title = "角色主页";
    String[][] breadcrumbs = null;
    String[][] operations = new String[][] {
            {"<img src='../images/new.gif' border=0>&nbsp;新建", "role.do?cmd=new" }
        };

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="roles" requestURI="roleList.do" id="role">
  <table:column property="name" title="角色名" href="role.do" paramId="name" paramProperty="name"/>
  <table:column property="description" title="描述" />
  <table:column title="编辑" align="center" >
      <html:link page="/system/role.do" paramName="role" paramId="name" paramProperty="name">
          <html:img page="/images/edit.gif" altKey="button.edit" border="0" align="bottom"/>
      </html:link>
  </table:column>
  <table:column title="删除" align="center" >
      <html:link page="/system/role.do?cmd=remove" paramName="role" paramId="name" paramProperty="name">
          <html:img page="/images/delete.gif" altKey="button.delete" border="0" align="bottom" onclick="return confirmDelete()"/>
      </html:link>
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
