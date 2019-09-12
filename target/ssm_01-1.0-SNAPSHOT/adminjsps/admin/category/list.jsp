<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="x-admin-sm">
  <head>
    <title>分类列表</title>
	  <meta name="renderer" content="webkit">

	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/category/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/css.css'/>">
  </head>
  
  <body>
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<caption class="captionAddOneLevel">
    	  <a style="font-size: 15px;" href="<c:url value='/adminjsps/admin/category/add.jsp'/>">添加一级分类</a>
    	</caption>
    	<tr class="trTitle">
    		<th style=" border-radius: 10px 0 0 0; ">分类名称</th>
    		<th>描述</th>
    		<th style="border-radius: 0 10px 0 0;">操作</th>
    	</tr>   
<c:forEach items="${parents }" var="parent">	
    	<tr class="trOneLevel">
    		<td width="200px;">${parent.cname }</td>
    		<td class="secondCol">${parent.desc }</td>
    		<td width="250px;">
    		  <a href="<c:url value='/admin/category/addChildPre.do?pid=${parent.cid }'/>">添加二级分类</a>
    		  <a href="<c:url value='/admin/category/editParentPre.do?cid=${parent.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该一级分类？')" href="<c:url value="/admin/category/deleteParent.do?cid=${parent.cid }"/>">删除</a>
    		</td>
    	</tr>
    <c:forEach items="${parent.children }" var="child">
    	<tr class="trTwoLevel">
    		<td>${child.cname }</td>
    		<td class="secondCol">${child.desc }</td>
    		<td width="200px;" align="right">
    		  <a href="<c:url value='/admin/category/editChildPre.do?cid=${child.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该二级分类？')" href="<c:url value="/admin/category/deleteChild.do?cid=${child.cid }"/>">删除</a>
    		</td>
    	</tr>
    </c:forEach>
</c:forEach>      	 	
    </table>
  </body>
</html>
