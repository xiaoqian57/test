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
    String title = "用户主页";
    String[][] breadcrumbs = new String[][] {
        {"用户列表",     "userList.do" },
        {Constants.commandTrans(cmd)+"用户", "" }
    };
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
    <logic:notEqual name="userForm" property="cmd" scope="request" value="create">
         <html:hidden property="username" />
    </logic:notEqual>
    <table class="form">
    <c:if test="${'editRoles' != param.cmd and 'editGroups' != param.cmd and 'password' != param.cmd}">
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
		 <logic:equal name="userForm" property="cmd" scope="request" value="update">
		 	<bean:write name="userForm" property="username"/>
		 </logic:equal>
		 <logic:equal name="userForm" property="cmd" scope="request" value="create">
			<html:text property="username" size="50"/>&nbsp;*
		 </logic:equal>
            </td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.fullName"/>:</td>
            <td><html:text property="fullName" size="50"/>&nbsp;*</td>
        </tr>
        <c:if test="${param.cmd == 'new' or param.cmd == 'create'}">
        <tr>
            <td class=label><bean:message key="prompt.password"/>:</td>
            <td><html:password property="password" size="50"/>&nbsp;*</td>
        </tr>
        </c:if>
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
        <c:if test="${param.cmd == 'password' or param.cmd == 'updatePassword'}">
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
        <tr>
            <td class=label>是否后台管理员:</td>
            <td>
                <html:radio property="grade" value="10">是</html:radio>
                <html:radio property="grade" value="1">否</html:radio>
            </td>
        </tr>        
        <tr>
            <td class=label>状态:</td>
            <td>
                <html:radio property="status" value="1">启用</html:radio>
                <html:radio property="status" value="0">禁用</html:radio>
                <html:radio property="status" value="2">待审核</html:radio>
            </td>
        </tr>        
        <c:if test="${param.cmd == 'new' or param.cmd == 'editRoles'}">
        <c:if test="${param.cmd == 'new'}">
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        </c:if>
        <tr>
            <td class=labelbold colspan="2">用户角色</td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
       <tr>
           <td colspan="2" align="center">
            <table class="pickList">
                <tr>
                    <th class="pickLabel">
                        尚未加入用户的角色
                    </th>
                    <td>
                    </td>
                    <th class="pickLabel">
                        已加入用户的角色
                    </th>
                </tr>
                <c:set var="leftList" value="${availableRoles}" scope="request"/>
                <c:set var="rightList" value="${userRoles}" scope="request"/>
                <c:import url="../layouts/pickList.jsp" charEncoding="GBK">
                    <c:param name="listCount" value="1"/>
                    <c:param name="leftId" value="availableRoles"/>
                    <c:param name="rightId" value="userRoles"/>
                </c:import>
            </table>
        </td>
      </tr>
      </c:if>
        <c:if test="${param.cmd == 'new' or param.cmd == 'editGroups'}">
        <c:if test="${param.cmd == 'new'}">
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        </c:if>
        <tr>
            <td class=labelbold colspan="2">用户所属组</td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
       <tr>
           <td colspan="2" align="center">
            <table class="pickList">
                <tr>
                    <th class="pickLabel">
                        尚未加入用户的组
                    </th>
                    <td>
                    </td>
                    <th class="pickLabel">
                        已加入用户的组
                    </th>
                </tr>
                <c:set var="leftList" value="${availableGroups}" scope="request"/>
                <c:set var="rightList" value="${userGroups}" scope="request"/>
                <c:import url="../layouts/pickList.jsp" charEncoding="GBK">
                    <c:param name="listCount" value="1"/>
                    <c:param name="leftId" value="availableGroups"/>
                    <c:param name="rightId" value="userGroups"/>
                </c:import>
            </table>
        </td>
      </tr>
      </c:if>

    </table>

    <table>
        <tr>
            <td align=center>
                <input type="submit" class="button" name="ok"   value="保存"> &nbsp;&nbsp;
                <input type="button" class="button" name="cancel" value="取消" onclick="location.href='userList.do';return false;" >
            </td>
        </tr>
    </table>

</html:form>
</div>

<script type="text/javascript">
<!-- This is here so we can exclude the selectAll call when roles is hidden -->
function onFormSubmit(theForm) {
    <c:if test="${param.cmd == 'password' or param.cmd == 'updatePassword'}">
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
    <c:if test="${param.cmd == 'new' or param.cmd == 'editRoles'}">
       selectAll('userRoles');
    </c:if>
    <c:if test="${param.cmd == 'new' or param.cmd == 'editGroups'}">
       selectAll('userGroups');
    </c:if>
    return validateUserForm(theForm);
}
</script>

<html:javascript formName="userForm" cdata="false" dynamicJavascript="true" staticJavascript="true"/>
<html:errors/>

</html:html>
