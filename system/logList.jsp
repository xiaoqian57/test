<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="../layouts/taglibs.jsp"%>

<html>
<head>
	<title>ͨԪ���ݹ���</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../style/global.css" type="text/css" media="screen, print" />
        <script language="javascript" src="../js/CalendarPopup.js"></script>
</head>

<%  // Title of this page and breadcrumbs
    String title = "��־���";
    String[][] breadcrumbs = null;
    String[][] operations = null;

%>
<%@ include file="../layouts/title.jsp" %>



<div id=body >

<table:table name="logs" requestURI="logList.do" id="log">
  <table:column property="operator" title="�����û�" sortable="true"/>
  <table:column property="operType" title="��������" sortable="true"/>
  <table:column property="operObject" title="��������" sortable="true"/>
  <table:column property="startTime" title="����ʱ��" sortable="true" />
  <table:column title="�������">
      <bean:define id="endFlag" name="log" property="endFlag" type="java.lang.Integer"/>
      <%=Constants.successTypes[endFlag.intValue()]%>
  </table:column>
</table:table>

<br />
<html:form action="/system/logList.do">
    <input type="hidden" name="cmd"/>
    <table>
        <tr>
            <td>
               <input type="image"  src="<%=request.getContextPath()%>/admin/images/btnClearall.gif" onclick="return doCmd('clearall')">&nbsp;
               &nbsp;
               <SCRIPT LANGUAGE="JavaScript" ID="jscal1xx">
                   var cal1xx = new CalendarPopup();
               </SCRIPT>
               <input type="text" name="selDate" size="10">
               <A href="#" onClick="cal1xx.select(document.forms[0].selDate,'anchor1xx','yyyy-MM-dd'); return false;" TITLE="ѡ������" NAME="anchor1xx" ID="anchor1xx">
               <img src="<%=request.getContextPath()%>/admin/images/calendar.gif" border="0" align="bottom"/></a>
               <input type="image"  src="<%=request.getContextPath()%>/admin/images/clear.gif" onclick="return doCmd('clear')">&nbsp;
            </td>
        </tr>
    </table>
</html:form>
</div>

<script type="text/javascript">
  function doCmd(cmd) {
    var msg = '��ȷ��Ҫ�����־��';
    if (confirm(msg)) {
        var tmpCmd = document.forms[0].cmd.value;
        document.forms[0].cmd.value = cmd;
        document.forms[0].submit();
    }
    return false;
  }
</script>

</html>
