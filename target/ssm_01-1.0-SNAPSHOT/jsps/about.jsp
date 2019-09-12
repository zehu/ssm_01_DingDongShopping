<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>main</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/lib/layui/css/layui.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js"></script>
  <meta http-equiv="content-type" content="text/html;charset=utf-8">

  <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
  <!--[if lt IE 9]>
  <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
  <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script>
    // 是否开启刷新记忆tab功能
    // var is_remember = false;
  </script>
  <!--
      <link rel="stylesheet" type="text/css" href="styles.css">
      -->
  <link rel="stylesheet" type="text/css"
        href="<c:url value='/jsps/css/main.css'/>">
</head>

<body>
<div class="site-nav-bg">
  <div class="site-nav w1200">
    <p class="sn-back-home">
      <i class="layui-icon layui-icon-home"></i>
      <a href="${pageContext.request.contextPath}/index.jsp">叮咚网上书城</a>
    </p>
    <div class="sn-quick-menu">

      <div class="login">
        <ul>
          <c:choose>
            <c:when test="${empty sessionScope.sessionUser }">
              <div class="layui-nav-item">

                <a href="<c:url value='/jsps/user/login.jsp'/>"
                   target="_parent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录&nbsp;|</a>
              </div>
              <div class="layui-nav-item to-index">
                <a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">&nbsp;注册会员</a>
              </div>

            </c:when>
            <c:otherwise>
              <div>
                <a href="javascript:;">会员：${sessionUser.loginname }&nbsp;&nbsp;|</a>
              </div>

              <div class="layui-nav-item to-index">
                <a href="<c:url value='/order/myOrders.do'/>" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="<c:url value='/jsps/user/pwd.jsp'/>" target="body">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="<c:url value='/user/quit.do'/>" target="_parent">退出</a>
              </div>

            </c:otherwise>

          </c:choose>
        </ul>
      </div>
      <div class="sp-cart"><a href="<c:url value='/cartItem/myCart.do'/>" target="body">购物车
        <img style="width: 20px;height: 20px" src="${pageContext.request.contextPath}/images/cart.png" target="body">
      </a></div>

    </div>
  </div>
</div>



<div class="header">
  <div class="headerLayout w1200">
    <div class="headerCon">
      <h1 class="mallLogo">
        <a href="#" title="叮咚书城">
          <img style="width: 70%;height: 70%" src="${pageContext.request.contextPath}/images/dd-logon.png">
        </a>
      </h1>
      <div class="mallSearch">
        <form action="<c:url value='/book/findByBname.do'/>" class="layui-form" novalidate target="body">
          <input type="text" name="bname" id="form1" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的书名">
          <button class="layui-btn" lay-submit lay-filter="formDemo">
            <i class="layui-icon layui-icon-search"></i>
          </button>
          <input type="hidden" name="" value="">
        </form>
      </div>
    </div>
  </div>
</div>


<div class="content content-nav-base about-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="<c:url value='/jsps/main.jsp'/>">所有商品</a>
            <a href="<c:url value='/jsps/buytoday.jsp'/>">今日团购</a>
            <a href="<c:url value='/jsps/information.jsp'/>">叮咚资讯</a>
            <a href="<c:url value='/jsps/about.jsp'/>" class="active">关于我们</a>
          </div>
        </div>
      </div>
    </div>


  <div class="banner-box">
    <div class="banner">
      
      <img src="${pageContext.request.contextPath}/book_img/us_banner.jpg" style="width: 100%">
      
    </div>
  </div>
  <div class="brief-content layui-clear w1200">
    <div class="img-box">
      <img src="${pageContext.request.contextPath}/book_img/top4.png">
      <img class="top" src="${pageContext.request.contextPath}/book_img/top5.png">
    </div>
    <div class="text">
      <p>随着互联网的飞速发展与普及，电子商务技术不断成熟，当代人的生活节奏加快，网上购物的人逐年增加，网上书城成为当代潮流发展中必不可少的产物。网上书城为用户提供一个搜索简单、品种丰富、易于购买，价格低廉的图书平台，克服了传统书店的种类不多，查找不便，为运行商价格较高的缺点，因此，有必要建立一个更加人性化、更加实用的网上书城</p>
    </div>
  </div>

    <div class="after-sale w1200">
      <h4>配送售后</h4>
      <div class="item-box">
        <div class="item item1">
          <div class="img-box">
            <img src="${pageContext.request.contextPath}/static/img/us_icon1.png">
          </div>
          <p>7天无理由退换货</p>
        </div>
        <div class="item item2">
          <div class="img-box">
            <img src="${pageContext.request.contextPath}/static/img/us_icon2.png">
          </div>
          <p>全场满99元顺丰包邮</p>
        </div>
        <div class="item item3">
          <div class="img-box">
            <img src="${pageContext.request.contextPath}/static/img/us_icon3.png">
          </div>
          <p>优质客服服务</p>
        </div>
      </div>
    </div>
  </div>

<script type="text/javascript">

layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm'],function(){
      var
     mm = layui.mm;
  
    

});
</script>
</body>
</html>
