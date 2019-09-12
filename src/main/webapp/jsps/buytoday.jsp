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



<div class="content content-nav-base buytoday-content">
  <div id="list-cont">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
              <a href="<c:url value='/jsps/main.jsp'/>">所有商品</a>
              <a href="<c:url value='/jsps/buytoday.jsp'/>" class="active">今日团购</a>
              <a href="<c:url value='/jsps/information.jsp'/>">叮咚资讯</a>
              <a href="<c:url value='/jsps/about.jsp'/>">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="banner-box">
      <div class="banner"></div>
    </div>
    <div class="product-list-box">
      <div class="product-list w1200">
        <div class="tab-title">
          <a href="javascript:;" class="active tuang" data-content="tuangou">今日团购</a>
          <a href="javascript:;" data-content="yukao">明日预告</a>
        </div>


        <div class="list-cont" cont = 'tuangou'>
          <div class="item-box layui-clsear" style="height: 1100px;text-align: center">
             <div style="height: 1100px;text-align: center;margin-left: 200px">

               <iframe frameborder="0"  src="<c:url value='/book/findByBname.do'/>"></iframe>
             </div>

          </div>
          <div id="demo0" style="text-align: center;"></div>
        </div>

        <div class="list-cont layui-hide" cont = 'yukao'>
          <div class="item-box layui-clsear" style="width: 80%;height: 1100px;text-align: center">
            <div style="height: 1100px;text-align: center;margin-left: 100px">

              <iframe frameborder="0"  src="<c:url value='/book/findByBname.do'/>"></iframe>
            </div>

          </div>

      </div>

      </div>


    </div>
    <div class="footer-wrap">
      <div class="footer w1200">
        <div class="title">
          <h3>团购销量榜</h3>
        </div>
        <div class="list-box layui-clear" id="footerList">
          <div class="item">
            <img src="${pageContext.request.contextPath}/book_img/top1.png" alt="">
            <div class="text">
              <div class="right-title-number">1</div>
              <div class="commod">
                <p>正版20册 人性的弱点狼道鬼谷子全集羊皮卷墨菲定律九型人格读心术口才三绝修心三不为人三会成功学图书籍</p>

              </div>
            </div>
          </div>
          <div class="item">
            <img src="${pageContext.request.contextPath}/book_img/top2.png" style="width: 95%" alt="">
            <div class="text">
              <div class="right-title-number">2</div>
              <div class="commod">
                <p>《羊皮卷》是世界上最伟大的励志丛书，它所蕴藏的力量改变了无数人的生活命运。</p>

              </div>
            </div>
          </div>
          <div class="item">
            <img src="${pageContext.request.contextPath}/book_img/top3.png" alt="">
            <div class="text">
              <div class="right-title-number">3</div>
              <div class="commod">
                <p>墨菲定律是一种心理学效应，由爱德华·墨菲（Edward A. Murphy）提出的，亦称墨菲法则、墨菲定理。</p>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 模版引擎导入 -->
<!--  <script type="text/html" id="demo">
   <div class="main-nav">
     <div class="inner-cont0">
       <div class="inner-cont1 w1200">
         <div class="inner-cont2">
           <a href="commodity.html">所有商品</a>
           <a href="buytoday.html" class="active">今日团购</a>
           <a href="information.html">母婴资讯</a>
           <a href="about.html">关于我们</a>
         </div>
       </div>
     </div>
   </div>
   <div class="banner-box">
     <div class="banner"></div>
   </div>
   <div class="product-list-box">
     <div class="product-list w1200">
       <div class="tab-title">
         <a href="javascript:;" class="active tuang">今日团购</a>
         <a href="javascript:;">明日预告</a>
       </div>
       <div class="list-cont">
         <div class="item-box layui-clear">
             {{# layui.each(d.productList,function(index,item){}}
             <div class="item">
               <img src="{{item.img}}" alt="">
               <div class="text-box">
                 <p class="title">{{item.title}}</p>
                 <p class="plic">
                   <span class="ciur-pic">{{item.ciurPic}}</span>
                   <span class="Ori-pic">{{item.OriPic}}</span>
                   <span class="discount">{{item.discount}}</span>
                 </p>
               </div>
             </div>
             {{#})}}
         </div>
        <div id="demo0" style="text-align: center;"></div>
       </div>
     </div>
   </div>
   <div class="footer-wrap">
     <div class="footer w1200">
       <div class="title">
         <h3>团购销量榜</h3>
       </div>
       <div class="list-box layui-clear" id="footerList">
            {{# layui.each(d.footerList,function(index,item){}}
             <div class="item">
               <img src="{{item.img}}" alt="">
               <div class="text">
                 <div class="right-title-number">1</div>
                 <div class="commod">
                   <p>{{item.title}}</p>
                   <span>{{item.price}}</span>
                 </div>
               </div>
             </div>
             {{# });}}
       </div>
     </div>
   </div>
 </script> -->
<script>

  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage','jquery'],function(){
    var laypage = layui.laypage,$ = layui.$;
    mm = layui.mm;
    laypage.render({
      elem: 'demo0'
      ,count: 100 //数据总数
    });


    $('body').on('click','*[data-content]',function(){
      $(this).addClass('active').siblings().removeClass('active')
      var dataConte = $(this).attr('data-content');
      $('*[cont]').each(function(i,item){
        var itemCont = $(item).attr('cont');
        console.log(item)
        if(dataConte === itemCont){
          $(item).removeClass('layui-hide');
        }else{
          $(item).addClass('layui-hide');
        }
      })
    })
    // 模版引擎导入
    //  var html = demo.innerHTML;
    //  var listCont = document.getElementById('list-cont');
    //  // console.log(layui.router("#/about.html"))
    // mm.request({
    //     url: '../json/buytoday.json',
    //     success : function(res){
    //       console.log(res)
    //       listCont.innerHTML = mm.renderHtml(html,res)
    //     },
    //     error: function(res){
    //       console.log(res);
    //     }
    //   })

  });
</script>


</body>
</html>