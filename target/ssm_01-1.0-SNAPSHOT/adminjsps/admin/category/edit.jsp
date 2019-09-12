<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加分类</title>
	<link rel="stylesheet" type="text/css" href="/ssm_01/adminjsps/admin/css/category/add_edit.css">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#cname").val()) {
				alert("分类名不能为空！");
				return false;
			}
			if(!$("#desc").val()) {
				alert("分类描述不能为空！");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
    <section>
    <h3>修改1级分类</h3>
    <h1></h1>
    <p style="font-weight: 900; color: red">${msg }</p>
    <form action="<c:url value='/admin/category/editParent.do'/>" method="post" onsubmit="return checkForm()">
    	<input type="hidden" name="cid" value="${parent.cid }"/>
    	分类名称：<input type="text" name="cname" id="cname" value="${parent.cname }"/><br/>
    	分类描述：<textarea rows="5" cols="50" id="desc" name="desc">${parent.desc }</textarea><br/>
    	<input type="submit" value="修改分类"/>
    	<input type="button" value="返回" onclick="history.go(-1)"/>
    </form>
    </section>
  </body>
</html>
