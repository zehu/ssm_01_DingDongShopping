<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>信息板</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="login-bg">
<c:choose>
    <c:when test="${code eq 'success' }">
        <c:set var="img" value="/images/duihao.jpg"/>
        <c:set var="title" value="成功"/>
    </c:when>
    <c:when test="${code eq 'error' }">
        <c:set var="img" value="/images/cuohao.png"/>
        <c:set var="title" value="失败"/>
    </c:when>

</c:choose>
<div class="login layui-anim layui-anim-up">
    <div class="message">${title }</div>
    <div id="darkbannerwrap"></div>
    <div class="divContent">
        <div style="text-align: center">

            <img src="<c:url value='${img }'/>" width="8%"/>
            <span style="font-size: 18px; color: #c30; font-weight: 900;">${msg}</span>
            <br/>
            <br/>
            <br/>
            <br/>
            <span style="font-size: 18px;margin-left: 5px; font-weight: 900;"><a target="_top"
                                                href="<c:url value='/jsps/user/login.jsp'/>">去登录</a></span>
            <span style="font-size: 18px;margin-left: 100px; font-weight: 900;"><a target="_top" href="<c:url value='/index.jsp'/>">返回主页</a></span>
        </div>
    </div>
</div>


</body>
</html>
