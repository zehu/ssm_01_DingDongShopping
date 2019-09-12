<%--
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员登录页面</title>
<style type="text/css">
body {
	font-family: "microsoft yahei";
	width: 100%;
	height: 100%;
	background: #272C2C;
    overflow: hidden;
}

header {
	width: 300px;
	height: 100px;
	margin: 100px auto;
	margin-bottom: 20px;
	text-align: center;
}

header p {
	font-size: 18px;
	color: #ccc;
}

header img {
	width: 310px;
}

section {
	width: 310px;
	height: 220px;
	border: 1px solid #aaa;
	margin: 50px auto;
	border-radius: 10px;
	box-shadow: 5px 5px 5px #aaa;
}

#adminname, #adminpwd {
	/*宽度，右内边距，边框，背景*/
	width: 200px;
	padding-left: 13px;
	border: 1px solid #ccc;
	border-radius: 8px;
	height: 33px;
	background: #272C2C;
	color: #ccc;
	font-family: "microsoft yahei";
	margin-bottom: 15px;
}

#adminname {
    margin-top: 50px;
}
.error{
    font-size: 14px;
    color: red;
    margin-left: 65px;
    position:absolute;
}
input {
	margin-left: 53px;
}

input[type="submit"] {
	width: 200px;
	height: 33px;
	border: 1px solid #03A0D5;
	border-radius: 8px;
	background: #03A0D5;
	font-family: "microsoft yahei";
    font-size: 15px;
	color: #111;
}

input[type="submit"]:hover {
	background: #03A0a0;
    cursor: pointer;
}
footer {
    margin-top: 120px;
}
footer img{
    width:90px;
    height:35px;
    border-radius: 3px;
}
footer p {
    color:#ccc;
    font-size: 12px;
    text-align: center;
}
</style>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
    src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript">
	function checkForm() {
		if (!$("#adminname").val()) {
			alert("管理员名称不能为空！");
			return false;
		}
		if (!$("#adminpwd").val()) {
			alert("管理员密码不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>

<body>
    <header> <img src="<c:url value='/images/ybig_logo.png'/> ">
    <p>管理员登录</p>
    </header>
    <section>
     <p class="error" style="font-size:14px; color: red">${msg }</p>
    <form action="<c:url value='/admin/admin/login.do'/>"
        method="post" target="_top">
        <input type="text" name="adminname" value="${admin.adminname }${adminname}" id="adminname"
            placeholder="管理员账户" /><br /> 
        <input type="password" name="adminpwd" id="adminpwd" placeholder="密码" /><br /> 
        <input type="submit" value="登录后台" />
    </form>
    </section>
    <footer>
        <p>Copyright &copy; 优思网 2013-2016, All Rights Reserved&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证041189号音像制品经营许可证 京音网8号</p>
        <p><img src="<c:url value='/images/beian.png'/> ">&nbsp;&nbsp;<img src="<c:url value='/images/kexin.png'/> "></p>
    </footer>
</body>
</html>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台登录-X-admin2.2</title>
    <base href="${pageContext.request.contextPath }/">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.validate.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


   <%-- <script type="text/javascript"
            src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
    <script type="text/javascript">
        function checkForm() {
            if (!$("#adminname").val()) {
                alert("管理员名称不能为空！");
                return false;
            }
            if (!$("#adminpwd").val()) {
                alert("管理员密码不能为空！");
                return false;
            }
            return true;
        }
    </script>--%>

</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">叮咚后台管理登录</div>
    <div id="darkbannerwrap"></div>

    <form action="<c:url value='/admin/admin/login.do'/>"
          method="post" target="_top" class="layui-form" id="form">
        <input type="text" name="adminname" value="${admin.adminname }${adminname}" id="adminname"
               placeholder="管理员账户" class="layui-input" >
        <p class="error" style="font-size:14px; color: red">${msg }</p>
        <hr class="hr15">
        <input type="password" name="adminpwd" id="adminpwd" placeholder="密码" type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录"  style="width:100%;" type="submit">
        <hr class="hr20" >

    </form>
    <%--<form action="<c:url value='/admin/admin/login.do'/>"
          method="post" target="_top">
        <input type="text" name="adminname" value="${admin.adminname }${adminname}" id="adminname"
               placeholder="管理员账户" /><br />
        <input type="password" name="adminpwd" id="adminpwd" placeholder="密码" /><br />
        <input type="submit" value="登录后台" />
    </form>--%>
</div>



<script>
    $(function() {
        $("#form").validate({
            rules : {
                adminname : {
                    required : true,
                    remote : "admin/admin/login.do"
                },
                adminpwd : {
                    required : true,
                    remote : {
                        url : "admin/admin/login.do",
                        type : "POST",
                        dataType : "json",
                        data : {
                            userno : function() {
                                return $("#adminname").val();
                            }
                        }
                    }

                },
            },
            messages : {
                adminname : {
                    remote : "该用户不存在"
                },
                password : {
                    remote : "密码不正确"
                },

            }
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