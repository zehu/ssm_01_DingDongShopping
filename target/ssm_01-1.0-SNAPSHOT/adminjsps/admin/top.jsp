<%--<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>top</title>
<base target="body">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	font-size: 14px;
	font-family: "microsoft yahei";
	background: rgb(78, 78, 78);
	color: #fff;
}

p {
	text-align: center;
	line-height: 30px;
	font-size: 30px;
	margin-top: 25px;
	color: #8AD700;
}

a {
	color: #bbb;
	margin-left: 6px;
	text-decoration: none;
}

a:hover {
	color: #fff;
}

.bodr_lf {
	border-left: 1px solid #bbb;
	border-right: 1px solid #bbb;
	padding-left: 10px;
	padding-right: 10px;
}
</style>
</head>

<body>
    <p>叮咚书店后台管理系统</p>
    <div style="line-height: 10px;">
        <span style="margin-left: 10px; color: #fff;">管理员：${sessionAdmin.adminname }</span> <a
            target="_top" href="<c:url value='/admin/admin/quit.do'/>">退出</a>
        <span style="padding-left: 50px;"> <a
            href="<c:url value='/admin/category/findAll.do'/>">分类管理</a>
            <a class="bodr_lf"
            href="<c:url value='/adminjsps/admin/book/main.jsp'/>">图书管理</a>
            <a href="<c:url value='/admin/order/findAll.do'/>">订单管理</a>
        </span>
    </div>
</body>
</html>--%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title id="show">后台登录-X-admin2.2</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/xadmin.css">
    <!-- <link rel="stylesheet" href="../css/theme5.css"> -->
    <script src="${pageContext.request.contextPath }/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
        function genxin() {
        var v;
        $.post(
                "SystemController/read",
                function(data){
                    $("#title").html("<img width='30px' height='30px' src='"+data.systemlogo+"'/>"+data.systemname+"后台管理系统");
                    $("#show").html(data.title);
                    clearInterval(v);
                },
                "json"
            )

    }

    v=setInterval('genxin()',300);
    </script> -->


</head>
<body class="index" onload="show()">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.jsp" id="title">叮咚书店后台管理系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">

        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="#">管理员：${sessionAdmin.adminname }</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a href="<c:url value='/admin/admin/quit.do'/>">切换帐号</a>
                </dd>

            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="/">前台首页</a></li>
    </ul>
</div>