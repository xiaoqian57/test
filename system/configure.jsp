<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>
<%@ page import="com.gpower.services.spider.store.*"%>

<html:html locale="true">
<head>
	<title>ͨԪ���ڽ�������</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css"/>
</head>

<%  // Title of this page and breadcrumbs
    String title = "ϵͳ����";
    String[][] breadcrumbs = null;
    String[][] operations = null;
%>
<%@ include file="../layouts/title.jsp" %>

<html:messages message="true" id="msg"
    header="messages.header" footer="messages.footer">
    <div class="message" align="center"><img src="../images/iconInformation.gif" class="icon" alt="Information" /><%= pageContext.getAttribute("msg") %></div>
</html:messages>

<div id=body align="center">
    <html:form action="/system/configure.do">
        <html:hidden property="cmd" />
        <table class="content">
        <tr>
            <td class=labelbold>ϵͳ����</td>
            <td align=right >* ������Ϣ</span></td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=label>ץȡ���ù���:</td>
            <td>
                    <html:radio property="share" value="1">����</html:radio>
                    <html:radio property="share" value="0">˽��</html:radio>
            </td>
        </tr>
        <tr>
            <td class=label>ץȡ�洢ѡ��:</td>
            <td>
          	<% for (int i = 0; i < ContentStoreManager.getNames().length; i++) { %>
                    <html:radio property="contentstore" value="<%=String.valueOf(i)%>"><%=ContentStoreManager.getNames()[i]%></html:radio><br>
                <% } %>
            </td>
        </tr>
        <tr>
            <td class=label>���ݹ���ϵͳ��ַ:</td>
            <td>
                <html:text property="cms_url" size="50"/>
            </td>
        </tr>
        <tr>
            <td class=label>�ļ��洢·��:</td>
            <td>
                <html:text property="xmlstore_path" size="50"/>
            </td>
        </tr>
        <tr>
            <td class=label>ץȡ������:</td>
            <td>
                <html:text property="agent" size="50"/>
            </td>
        </tr>
        <% if ("Advanced".equals(RadarConstants.PRODUCT_TYPE) ) { %>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=labelbold colspan="2">ȫ�ļ���</td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=label>�Ƿ�����:</td>
            <td>
                    <html:radio property="search_enabled" value="true">����</html:radio>
                    <html:radio property="search_enabled" value="false">��ֹ</html:radio>
            </td>
        </tr>
        <tr>
            <td class=label>�������¼��:</td>
            <td><html:text property="search_interval" size="10"/>����</td>
        </tr>
        <% } %>
        </table>
        <table>
            <tr>
                <td align=center>
                    <input type="submit" class="button" name="ok"   value="����">
                </td>
            </tr>
        </table>
    </html:form>
</div>

</html:html>
