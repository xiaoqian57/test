<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html:html locale="true">
<head>
	<title>通元内容管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css"/>
        <link rel="stylesheet" href="../style/messages.css" type="text/css"/>
        <script language="javascript" src="../js/selectbox.js"></script>
</head>

<bean:define id="cmd" name="roleForm" property="cmd" scope="request" type="String"/>

<%  // Title of this page and breadcrumbs
    String title = "角色主页";
    String[][] breadcrumbs = new String[][] {
            {"角色列表",     "roleList.do" },
            {Constants.commandTrans(cmd)+"角色", "" }
        };
    String[][] operations = null;
%>
<%@ include file="../layouts/title.jsp" %>

<html:messages message="true" id="msg"
    header="messages.header" footer="messages.footer">
    <div class="message" align="center"><img src="../images/iconInformation.gif" class="icon" alt="Information" /><%= pageContext.getAttribute("msg") %></div>
</html:messages>

<div id=body align="center">

<html:form action="/system/role.do" onsubmit="return onFormSubmit(this);">
    <html:hidden property="cmd" />
    <table class="form">
        <tr>
            <td class=labelbold>角色信息</td>
            <td align=right >* 必填信息</span></td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.name"/>:</td>
            <td>
		 <logic:equal name="roleForm" property="cmd" scope="request" value="update">
		 	<bean:write name="roleForm" property="name"/>
                 	<html:hidden property="name" />
		 </logic:equal>
		 <logic:equal name="roleForm" property="cmd" scope="request" value="create">
			<html:text property="name" size="50"/>&nbsp;*
		 </logic:equal>
            </td>
        </tr>
        <tr>
            <td class=label><bean:message key="prompt.description"/>:</td>
            <td><html:text property="description" size="50"/>&nbsp;*</td>
        </tr>

    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=labelbold colspan="2">角色权限</td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
       <tr>
           <td colspan="2" align="center">
            <table class="pickList">
                <tr>
                    <th class="pickLabel">
                        尚未加入角色的权限
                    </th>
                    <td>
                    </td>
                    <th class="pickLabel">
                        已加入角色的权限
                    </th>
                </tr>
                <c:set var="leftList" value="${availablePermissions}" scope="request"/>
                <c:set var="rightList" value="${rolePermissions}" scope="request"/>
                <c:import url="../layouts/pickList.jsp" charEncoding="GBK">
                    <c:param name="listCount" value="1"/>
                    <c:param name="leftId" value="availablePermissions"/>
                    <c:param name="rightId" value="rolePermissions"/>
                </c:import>
            </table>
        </td>
      </tr>

    </table>

    <table>
        <tr>
            <td align=center>
                <input type="submit" class="button" name="ok"   value="保存"> &nbsp;&nbsp;
                <input type="button" class="button" name="cancel" value="取消" onclick="location.href='roleList.do';return false;" >
            </td>
        </tr>
    </table>

</html:form>
</div>

<script type="text/javascript">
<!-- This is here so we can exclude the selectAll call when roles is hidden -->
function onFormSubmit(theForm) {
    selectAll('rolePermissions');
    return validateRoleForm(theForm);
}
</script>

<html:javascript formName="roleForm" cdata="false" dynamicJavascript="true" staticJavascript="true"/>
<html:errors/>

</html:html>
