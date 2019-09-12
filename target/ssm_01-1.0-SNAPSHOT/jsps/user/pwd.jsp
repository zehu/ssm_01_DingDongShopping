<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
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

<div class="login layui-anim layui-anim-up">
    <div class="message">修改密码</div>
    <div id="darkbannerwrap"></div>
    <form  action="<c:url value='/user/updatePassword.do'/>" method="post" id="loginForm" target="_top" >
        <table>

            <tr>
                <td>
                    <input class="input" type="password" placeholder="原密码"
                           name="loginpass" id="loginpass" value="${user.loginpass }" />
                </td>
            </tr>
            <tr>
                <td><label id="loginpassError" class="error">${msg }</label></td>
            </tr>


            <tr>
                <td class="inputTd">
                    <hr class="hr15">
                    <input class="input" type="password" placeholder="新密码" name="newpass" id="newpass" value="${user.newpass }" /></td>
                <hr class="hr15">
            </tr>
            <tr>
                <td><label id="newpassError" class="error"></label></td>
            </tr>


            <tr>
                <td class="inputTd">
                    <hr class="hr15">
                    <input class="input" type="password" placeholder="确认密码" name="reloginpass" id="reloginpass" value="${user.reloginpass }" /></td>
                <hr class="hr15">
            <tr>
            <td><label id="reloginpassError" class="error"></label></td>
            </tr>
            <tr>
                <td class="inputTd">
                    <hr class="hr15">
                    <input class="input" type="text"  placeholder="验证码" name="verifyCode" id="verifyCode" value="" />
                    <img id="vCode" src="/ssm_01/verifyCode" title="点击更换"
                         onclick="this.setAttribute('src','/ssm_01/verifyCode?'+Math.random());"/>
                    <hr class="hr15">
                </td>
            </tr>
            <tr>
                <td><label id="verifyCodeError" class="error"></label></td>
            </tr>

            <tr>
                <td>
                    <hr class="hr15">
                    <input value="确认修改"   type="submit">
                    <hr class="hr20" >
                </td>

            </tr>

        </table>
    </form>

</div>
</body>
</html>
