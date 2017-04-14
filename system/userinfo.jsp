<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html:html locale="true">
<head>
	<title>通元内容管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css"/>
        <script language="javascript" src="../js/selectbox.js"></script>
</head>

<bean:define id="cmd" name="userForm" property="cmd" scope="request" type="String"/>

<%  // Title of this page and breadcrumbs
    String title = "修改个人信息";
    String[][] breadcrumbs = null;
    String[][] operations = null;
%>
<%@ include file="../layouts/title.jsp" %>

<html:messages message="true" id="msg"
    header="messages.header" footer="messages.footer">
    <div class="message" align="center"><img src="../images/iconInformation.gif" class="icon" alt="Information" /><%= pageContext.getAttribute("msg") %></div>
</html:messages>

<div id=body align="center">

<html:form action="/system/user.do" onsubmit="return onFormSubmit(this);">
    <html:hidden property="cmd" />
    <html:hidden property="username" />
    <table class="form">
        <c:if test="${'true' != param.updatepass}">
        <tr>
            <td class=labelbold>用户信息</td>
            <td align=right >* 必填信息</span></td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.username"/>:</td>
            <td>
		 <bean:write name="userForm" property="username"/>
            </td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.fullName"/>:</td>
            <td><html:text property="fullName" size="50"/></td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.password"/>:</td>
            <td><html:password property="password" size="50"/></td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.email"/>:</td>
            <td><html:text property="email" size="50"/></td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.phone"/>:</td>
            <td><html:text property="phone" size="50"/></td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.mobilePhone"/></td>
            <td><html:text property="mobilePhone" size="50"/></td>
        </tr>
        </c:if>
        <c:if test="${ param.updatepass == 'true'}">
        <input type="hidden" name="updatepass" value="true">
        <tr>
            <td class=labelbold colspan="2">请输入密码</td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.password"/>:</td>
            <td><html:password property="password" size="50"/></td>
        </tr>
        <tr>
            <td class=label>确认密码:</td>
            <td><input type="password" size="50" name="confirmPassword"></td>
        </tr>
        </c:if>
    </table>

    <table>
        <tr>
            <td align=center>
                <input type="submit" class="button" name="ok"   value="保存"> &nbsp;&nbsp;
            </td>
        </tr>
    </table>

</html:form>
</div>

<script type="text/javascript">
<!-- This is here so we can exclude the selectAll call when roles is hidden -->
function onFormSubmit(theForm) {
    <c:if test="${param.updatepass == 'true'}">
        if(theForm.confirmPassword.value==""){
                alert("您没有输入确认密码，请您重新输入！");
                theForm.confirmPassword.focus();
                return false;
        }
        if(theForm.confirmPassword.value!=theForm.password.value){
                alert("您两次输入的密码不相同，请您重新确认您的密码！");
                theForm.confirmPassword.focus();
                return false;
        }
    </c:if>
    return validateUserForm(theForm);
}
</script>

<html:javascript formName="userForm" cdata="false" dynamicJavascript="true" staticJavascript="true"/>
<html:errors/>

</html:html>
