<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html:html locale="true">
<head>
	<title>通元内容管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css"/>
        <script language="javascript" src="../js/global.js"></script>
</head>

<%  // Title of this page and breadcrumbs
    String title = "个人信息中心";
    String[][] breadcrumbs = null;
    String[][] operations = null;
%>
<%@ include file="../layouts/title.jsp" %>

<bean:define id="user" name="user" type="com.gpower.services.user.provider.hibernate.entity.HibernateUser"/>

<html:messages message="true" id="msg"
    header="messages.header" footer="messages.footer">
    <div class="message" align="center"><img src="../images/iconInformation.gif" class="icon" alt="Information" /><%= pageContext.getAttribute("msg") %></div>
</html:messages>

<div align="center">
     <a href="user.do?cmd=info"><img alt="编辑" src="../images/btnEdit.gif"/></a>&nbsp;
     <a href="user.do?cmd=info&updatepass=true"><img alt="修改密码" src="../images/btnPassword.gif"/></a>&nbsp;
</div>

<div id="menuDiv">
    <ul id="menuList">
    	<li <c:if test="${param.tab == null or param.tab == '1'}">class="selected"</c:if>><a href="userProfiler.do" title="个人资料">个人资料</a></li>
    </ul>
</div>

<div id=tabcontent >
    <c:choose>
        <c:when test="${param.tab == null or param.tab == '1'}">
            <table class="view">
                <tr>
                    <td class=label width="80px"><bean:message key="prompt.username"/>:</td>
                    <td class=text><c:out value="${user.name}"/></td>
                </tr>
                <tr>
                    <td class=label><bean:message key="prompt.fullName"/>:</td>
                    <td class=text><c:out value="${user.fullName}"/>&nbsp;</td>
                </tr>
                <tr>
                    <td class=label><bean:message key="prompt.email"/>:</td>
                    <td class=text><c:out value="${user.email}"/>&nbsp;</td>
                </tr>
                <tr>
                    <td class=label><bean:message key="prompt.phone"/>:</td>
                    <td class=text><%=(user.getPropertyAsString("phone")!=null)?user.getPropertyAsString("phone"):"&nbsp;"%></td>
                </tr>
                <tr>
                    <td class=label><bean:message key="prompt.mobilePhone"/>:</td>
                    <td class=text><%=(user.getPropertyAsString("mobilePhone")!=null)?user.getPropertyAsString("mobilePhone"):"&nbsp;"%></td>
                </tr>
            </table>
        </c:when>
    </c:choose>
</div>

<script type="text/javascript">
  function confirmDelete() {
    var msg = '<bean:message key="confirm.delete"/>';
    return confirm(msg);
  }
</script>

</html:html>
