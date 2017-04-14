<%@page import="com.gpower.services.user.provider.hibernate.entity.HibernateUser"%>
<%@page import="com.gpower.services.user.UserHelper"%>
<%@page import="com.gpower.services.user.UserService"%>
<%@page import="com.gpower.web.SessionUtil"%>
<%@page import="com.gpower.util.Constants"%>
<%@page import="com.gpower.util.ParamUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/gp-html.tld"    prefix="gp-html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<gp-html:checkLoggedIn page="/webs/admin/login.do?method=preLogin"/>
<!DOCTYPE html>
<head>
	<title>美丽化工-账号列表</title>
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="author" content="">
    <link href="style/css/qa.css" rel="stylesheet" type="text/css">
    <link href="style/css/quote.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
    a {
  text-decoration: none;
 }
    </style>
   
    <%
        int pageCount = 0;
    	UserService userService = UserHelper.getUserService();
    	int total = userService.getUserCount();
    	int rows = Constants.PAGE_ROWS;
    	int nPage = ParamUtil.getIntParameter(request, "page", 1);
    	List<HibernateUser> users = userService.getUsers(null, nPage, rows);
    	pageCount = (total - 1) / rows +1;
    	request.setAttribute("page", new Integer(nPage));
    	request.setAttribute("pageCount",new Integer(pageCount));
    	request.setAttribute("users", users);
    	request.setAttribute("userName", SessionUtil.getUsername(request));
    %>
<script type="text/javascript" src="style/js/jquery.min.js"></script>
<script type="text/javascript" src="style/js/jquery.twbsPagination.min.js"></script>
<script type="text/javascript" src="style/js/Gruntfile.js"></script>
</head>
 <c:if test="${requestScope.userName=='admin'}">
<body>


<div class="ASKwindow" style="min-width:1170px;">

  <div class="ask_banner">
  
    <span class="chem-logo"><a href="/column/INDEX"><img src="style/css/logo3-dark.png" alt="Logo"></a></span>
    
    <div class="banner_t">账号管理</div>
    
 <div style=" clear:both; width:1170px;"></div>
    <div style="float: right;font-size: x-small;margin: 20px 10px 10px 0;">
   <a href="/webs/admin/questionList.do">返回问题列表</a> <a href="logout.jsp">退出</a>
    </div>
    
  </div>
</div>
   
   <div class="questlist">
   
<html:form action="/admin/userList.do"	onsubmit="return submit();">
<table width="100%" border="0" cellpadding="7" cellspacing="1" class="tab01">
    <tr>
          <th scope="col">账号</th>
          <th scope="col">创建时间</th>
          <th scope="col">状态</th>
           <th scope="col">操作</th>
    </tr>
    <c:forEach var="user" items="${requestScope.users}">
        <tr>
         <td align="center"><c:out value="${user.name}" /></td>
          <td align="center"><c:out value="${user.creationDate}" /></td>
          <td align="center">
          <c:choose>
          	<c:when test="${user.status==0}">
          		<a userid="${user.ID}" class="status" style="cursor:pointer">已激活</a>
          	</c:when>
          	<c:otherwise>
				<a  userid="${user.ID}" class="status" style="color:red;cursor:pointer">已禁用</a>
          	</c:otherwise>
          </c:choose>
           <td align="center"><a userid="${user.ID}" class="delete" style="cursor:pointer">删除</a></td>
        </tr>
     </c:forEach>   
	
    </table>
    <input type="hidden" value="cmd" id="cmd" name="cmd" />
    <input type="hidden" value="${requestScope.page}" id="page" name="page" />
    </html:form>
        <div id="pagination-demo" class="quotes"></div>
</div>


<div class="copyright" style="min-width:1170px;">Copyright &copy; 2016 清华大学</div>

</body>

<script type="text/javascript">
$('#pagination-demo').twbsPagination({
    totalPages: ${requestScope.pageCount},
    startPage : ${requestScope.page},
    visiblePages: 7,
    first : "首页",
    prev : "上一页",
    next : "下一页",
    last : "最后",
    href: '${pageContext.request.contextPath}/admin/userList.jsp?page={{number}}',
    onPageClick: function (event, page) {
        $('#page-content').text('Page ' + page);
    }
});

function remove(){
		document.getElementById("cmd").value = "remove";
	    document.getElementsByName('questionListAdminForm')[0].submit();
}

function approve(){
	document.getElementById("cmd").value = "approve";
    document.getElementsByName('questionListAdminForm')[0].submit();
}

$(document).ready(function(){
	  $(".status").click(function(){
		  $.ajax({
			  method: "POST",
			  url: "updateUserStatus.jsp",
			  data: { id: $(this).attr("userid") }
			})
			  .done(function(  ) {
			   location.reload();
			  });
	  });
	  $(".delete").click(function(){
		  var statu = confirm("确定删除该账号吗");
		  if(!statu){
		   return false;
		  }
		  $.ajax({
			  method: "POST",
			  url: "deleteUser.jsp",
			  data: { id: $(this).attr("userid") }
			})
			  .done(function(  ) {
			   location.reload();
			  });
	  });
	  
	});
</script>

</html>
</c:if>