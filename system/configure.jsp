<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>
<%@ page import="com.gpower.services.spider.store.*"%>

<html:html locale="true">
<head>
	<title>通元公众交互管理</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css"/>
</head>

<%  // Title of this page and breadcrumbs
    String title = "系统设置";
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
            <td class=labelbold>系统设置</td>
            <td align=right >* 必填信息</span></td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=label>抓取配置共享:</td>
            <td>
                    <html:radio property="share" value="1">共享</html:radio>
                    <html:radio property="share" value="0">私有</html:radio>
            </td>
        </tr>
        <tr>
            <td class=label>抓取存储选择:</td>
            <td>
          	<% for (int i = 0; i < ContentStoreManager.getNames().length; i++) { %>
                    <html:radio property="contentstore" value="<%=String.valueOf(i)%>"><%=ContentStoreManager.getNames()[i]%></html:radio><br>
                <% } %>
            </td>
        </tr>
        <tr>
            <td class=label>内容管理系统网址:</td>
            <td>
                <html:text property="cms_url" size="50"/>
            </td>
        </tr>
        <tr>
            <td class=label>文件存储路径:</td>
            <td>
                <html:text property="xmlstore_path" size="50"/>
            </td>
        </tr>
        <tr>
            <td class=label>抓取代理名:</td>
            <td>
                <html:text property="agent" size="50"/>
            </td>
        </tr>
        <% if ("Advanced".equals(RadarConstants.PRODUCT_TYPE) ) { %>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=labelbold colspan="2">全文检索</td>
        </tr>
    	<tr>
            <td class=borderline colspan=2></td>
        </tr>
        <tr>
            <td class=label>是否启用:</td>
            <td>
                    <html:radio property="search_enabled" value="true">启用</html:radio>
                    <html:radio property="search_enabled" value="false">禁止</html:radio>
            </td>
        </tr>
        <tr>
            <td class=label>索引更新间隔:</td>
            <td><html:text property="search_interval" size="10"/>分钟</td>
        </tr>
        <% } %>
        </table>
        <table>
            <tr>
                <td align=center>
                    <input type="submit" class="button" name="ok"   value="设置">
                </td>
            </tr>
        </table>
    </html:form>
</div>

</html:html>
