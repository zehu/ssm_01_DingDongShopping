<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title id="show">后台登录-X-admin2.2</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/xadmin.css">
    <!-- <link rel="stylesheet" href="../css/theme5.css"> -->
    <script src="${pageContext.request.contextPath }/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
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
<body class="index">
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
            <a href="${pageContext.request.contextPath }/index.jsp">前台首页</a></li>
    </ul>
</div>
<!-- 顶部结束 -->

<!-- 中部开始 -->


<!-- 左侧菜单开始 -->

<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="分类管理">&#xe6f5;</i>
                    <cite>分类管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('分类列表','${pageContext.request.contextPath}/admin/category/findAll')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>分类列表</cite>
                        </a>
                    </li>
                </ul>

            </li>


            <li>

            <li><a href="javascript:;">
                <i class="iconfont left-nav-li" lay-tips="图书管理">&#xe6ce;</i>
                <cite>图书管理</cite>
                <i class="iconfont nav_right">&#xe697;</i>
            </a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('添加图书','${pageContext.request.contextPath }/admin/book/addPre.do')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>添加图书</cite></a>
                    </li>


                    <li>
                        <a href="<c:url value='/admin/book/findCategoryAll'/>">
                            <i class="iconfont left-nav-li" lay-tips="图书浏览修改">&#xe6ce;</i>
                            <cite>图书浏览修改</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <c:forEach items="${parents}" var="parent">
                            <li><a href="javascript:;"> <i class="iconfont">&#xe6fc;</i>
                                <cite>${parent.cname}</cite> <i class="iconfont nav_right">&#xe697;</i>
                            </a>
                                <c:forEach items="${parent.children}" var="child">
                                    <ul class="sub-menu">
                                        <li>
                                            <a onclick="xadmin.add_tab('${child.cname}','/ssm_01/admin/book/findByCategory.do?cid=${child.cid}')">
                                                <i class="iconfont">&#xe6a7;</i>
                                                <cite>${child.cname}</cite>
                                            </a>
                                        </li>

                                    </ul>
                                </c:forEach>
                                </c:forEach>
                            </li>

                        </ul>
                </ul>
            </li>


            <!-- 订单管理 -->

            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="订单管理">&#xe811;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('订单详情','${pageContext.request.contextPath }/admin/order/findAll')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单详情</cite></a>
                    </li>

                </ul>
            </li>


            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="权限管理">&#xe726;</i>
                    <cite>权限管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('管理员列表','${pageContext.request.contextPath }/error.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('角色管理','${pageContext.request.contextPath }/error.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>角色管理</cite></a>
                    </li>


                    <li>
                        <a onclick="xadmin.add_tab('权限管理','${pageContext.request.contextPath }/error.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限管理</cite></a>
                    </li>
                </ul>
            </li>


            <!-- 系统管理 -->
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="系统管理">&#xe6f5;</i>
                    <cite>系统管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('自定义设置','${pageContext.request.contextPath }/error.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>自定义设置</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('数据库连接设置','${pageContext.request.contextPath }/error.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>数据库连接设置</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('数据库的备份与恢复','${pageContext.request.contextPath }/error.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>数据库的备份与恢复</cite></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${pageContext.request.contextPath }/adminjsps/admin/body.jsp' frameborder="0"
                        scrolling="yes" class="x-iframe"></iframe>
            </div>

        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<script>//百度统计可去掉
var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>