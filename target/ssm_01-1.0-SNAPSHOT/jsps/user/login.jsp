<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>叮咚书城登录</title>
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


	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/jsps/js/user/login.js'/>"></script>
	<script type="text/javascript">
		$(function(){
			var loginname = window.decodeURI("${cookie.loginname.value}");
			if("${requestScope.user.loginname}"){
				loginname="${requestScope.user.loginname}";
			}
			$("#loginname").val(loginname);
		});
	</script>

</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
	<div class="message">欢迎登录叮咚书城</div>
	<div id="darkbannerwrap"></div>

	<form  action="<c:url value='/user/login.do'/>" method="post" id="loginForm" target="_top" >
		<table>

			<tr>
				<td>

					<input type="text" class="txtUserpwd input" placeholder="用户名" name="loginname" id="loginname" value="${user.loginname }">

				</td>
			</tr>
			<tr>
				<td><label class="error" id="loginnameError">${msg } ${errors.loginname}</label></td>
			</tr>
			<tr>
				<td>
					<input type="password" class="txtUserpwd input" placeholder="密码" name="loginpass" id="loginpass" value="${user.loginpass }">

				</td>
			</tr>
			<tr>
				<td><label class="error" id="loginpassError">${errors.loginpass}</label></td>
			</tr>


			<tr>
				<td>
					<input type="text" class="txtVerifyCode input" placeholder="验证码" name="verifyCode" id="verifyCode" value="${user.verifyCode }">
					<img id="vCode" src="/ssm_01/verifyCode" title="点击更换"
						 onclick="this.setAttribute('src','/ssm_01/verifyCode?'+Math.random());"/>
				</td>
			</tr>

			<tr>
				<td><label class="error" id="verifyCodeError">${errors.verifyCode }</label></td>
			</tr>
			<%--<tr>
				<td>
					<hr class="hr15">
					<input type="text" class="txtVerifyCode input" placeholder="验证码" name="verifyCode" id="verifyCode" value="${user.verifyCode }">

					<img id="vCode" src="/ssm_01/verifyCode" title="点击更换"
						 onclick="this.setAttribute('src','/ssm_01/verifyCode?'+Math.random());"/>
				</td>
			</tr>
			<tr>
				<td><label class="error" id="verifyCodeError">${errors.verifyCode }</label></td>
			</tr>--%>



			<tr>
				<td>
					<input type="checkbox" id="chkAuto" name="autoLogin">
					<label for="chkAuto" class="lbAuto">自动登录</label>
					<!-- <input type="checkbox" id="chkSafe" name="forgetPwd"> -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


					<a href="#" class="forgetPwd" style="padding-right: 2px">忘记密码?</a>&nbsp;|&nbsp;
					<a href="<c:url value='/jsps/user/regist.jsp'/>">免费注册</a>
				</td>
			</tr>
			<tr>
				<td>
					<hr class="hr15">
					<input value="登录"   type="submit">
					<hr class="hr20" >
				</td>
				<%--<td>
					<input type="submit" id="btnLogin" value="">
				</td>--%>
			</tr>

		</table>
	</form>
</div>

<script>
	$(function  () {
		layui.use('form', function(){
			var form = layui.form;
			// layer.msg('玩命卖萌中', function(){
			//   //关闭后的操作
			//   });
			//监听提交
			form.on('submit(login)', function(data){
				// alert(888)
				layer.msg(JSON.stringify(data.field),function(){
					location.href='index.html'
				});
				return false;
			});
		});
	})
</script>
<!-- 底部结束 -->
<script>
	//百度统计可去掉
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
</body>
</html>
