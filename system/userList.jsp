<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>ͨԪ���ݹ���</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
</head>

<%  // Title of this page and breadcrumbs
    String title = "�û���ҳ";
    String[][] breadcrumbs = null;
    String[][] operations = new String[][] {
            {"<img src='../images/new.gif' border=0>&nbsp;�½�", "user.do?cmd=new" }
        };

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="users" requestURI="userList.do" id="user">
  <table:column property="name" title="�û���" sortable="true" href="user.do" paramId="username" paramProperty="name"/>
  <table:column property="fullName" title="����" sortable="true"/>
  <table:column property="email" autolink="true" title="�����ʼ�" />
  <table:column title="�༭" align="center" >
      <html:link page="/system/user.do?cmd=edit" paramName="user" paramId="username" paramProperty="name">
           <html:img page="/images/edit.gif" altKey="button.edit" border="0" align="bottom"/>
      </html:link>
  </table:column>
  <table:column title="ɾ��" align="center" >
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
