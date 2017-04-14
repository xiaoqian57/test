<%@page import="com.gpower.util.ParamUtil"%>
<%@page import="com.gpower.services.user.provider.hibernate.entity.HibernateUser"%>
<%@page import="com.gpower.services.entity.EntityHelper"%>
<%@page import="com.gpower.services.entity.EntityService"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	EntityService entityService = EntityHelper.getEntityService();
    String id = ParamUtil.getParameter(request, "id");
    HibernateUser user =  (HibernateUser)entityService.get(HibernateUser.class, id);
    if(user.getStatus()==0) {
    	user.setStatus(1);
    }else {
    	user.setStatus(0);
    }
    entityService.update(user);
	
%>

