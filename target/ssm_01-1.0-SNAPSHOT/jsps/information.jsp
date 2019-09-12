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


  <div class="content content-nav-base information-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="<c:url value='/jsps/main.jsp'/>">所有商品</a>
            <a href="<c:url value='/jsps/buytoday.jsp'/>">今日团购</a>
            <a href="<c:url value='/jsps/information.jsp'/>" class="active">叮咚资讯</a>
            <a href="<c:url value='/jsps/about.jsp'/>">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="info-list-box">
      <div class="info-list w1200">
        <div class="item-box layui-clear" id="list-cont">
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/1C71001A04214B4EA22012387BB4CB61_25060183-1_b_3.jpg" alt="">
            </div>
            <div class="text">
              <h4>为什么要读书？</h4>
              <p class="data">2019-9-11  11:20:26</p>
              <p class="info-cont">读书无外乎三个目的。
                第一、娱乐。读书是一种业余时间放松心情的方式，
                第二、学习。从书籍中汲取个人成长的能量。
                第三、见识。书籍是人类知识、经验、想象的承载。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/1AE6580FB22B4FE8A701A63A0C8C95BC_27849674-1_b_1.jpg" alt="">
            </div>
            <div class="text">
              <h4>买书是浪费吗？</h4>
              <p class="data">2019-9-11  11:20:26</p>
              <p class="info-cont">如果想让读书成为一个融入生活的习惯，就必须营造读书的环境。让家里充满书，你读或者不读，书就在那里，又是信手拈来一本，翻开看个几页，何尝不是一种惬意呢。
              </p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/2E4E3680AF97459CA1EBA75A26E8C138_11.jpg" alt="">
            </div>
            <div class="text">
              <h4>读过的书，很多都忘了，读书还有什么意义呢?</h4>
              <p class="data">2019-9-11  11:20:26</p>
              <p class="info-cont">读书的意义从来都不取决于有没有记住，而在于有没有用上。读书都会忘，这没什么大不了的，要认识到人脑的主要功能是创造，而不是记忆。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/3DD8455EEC174402BF35D649549C4839_26909258-1_b_1.jpg" alt="">
            </div>
            <div class="text">
              <h4>读过很多书，明白很多道理，但依然过不好这一生，读书还有什么用？</h4>
              <p class="data">2019-9-11  11:20:26</p>
              <p class="info-cont">读书不是终点，读书是个起点。如果误把起点当终点，读书可能真的没啥用。有很多人不读书也过好了这一生，但是，当新世界的大门打开了，你已经从门缝看到了里面的五光十色，一辈子不进去，会不会也有点遗憾呢。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/4C8A11FBC246495C8745687DA25ACB83_23396358-1_b_2.jpg" alt="">
            </div>
            <div class="text">
              <h4>读书真的是生活的必需品吗？</h4>
              <p class="data">2019-9-11  11:20:26</p>
              <p class="info-cont">读书只是一种选择，是百万种选择中的一种而已。不要神话读书这件事，没有什么事必须的，读书也一样。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/3A31297EEA79428CB3E210E33A4318C7_27870774-1_b_1.jpg" alt="">
            </div>
            <div class="text">
              <h4>碎片化阅读不如系统阅读有价值？</h4>
              <p class="data">2019-9-11  11:20:26</p>
              <p class="info-cont">知识，本来就是一块一块，只是我们人为的把他们组成了一个个框架体系。人，应该是从自己的需求出发，缺什么补什么的学习和吸收，才是最有效的阅读。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/5F331A587489460A847446810DEC19E1_23962042-1_b_5.jpg" alt="">
            </div>
            <div class="text">
              <h4>我该怎样阅读？</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">想怎么阅读怎么阅读，电子书、纸质书都行；想什么时候读就什么时候读，早上也行，晚上也行；想在哪儿读就在哪儿读，厕所也行，卧室也行；只要你高兴，怎么都行。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/8FA5EEBCE4E34D72ADB2ECF3DFD45494_23615034-1_b_1.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">古人云：“书中自有黄金屋，书中自有颜如玉。”可见，古人对阅读的情有独钟。其实，对于任何人而言，阅读最大的好处在于：它让求知的人从中获知，让无知的人变得有知。读史蒂芬霍金的《时间简史》和《果壳中的宇宙》，畅游在粒子、生命和星体的处境中，感受智慧的光泽，犹如攀登高山一样，瞬间眼前呈现出仿佛九叠画屏般的开阔视野。于是，便像李白在诗中所写到的“庐山秀出南斗旁，屏风九叠云锦张，影落明湖青黛光”。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/80E1A9D35BA8408F94B6A54FD6DD89B9_25858636-1_b_2.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处??</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">对于坎坷曲折的人生道路而言，阅读便是最佳的润滑剂。面对苦难，我们苦闷、彷徨、悲伤、绝望，甚至低下了曾经高贵骄傲的头。然而我们可否想到过书籍可以给予我们希望和勇气，将慰藉缓缓注入我们干枯的心田，使黑暗的天空再现光芒？读罗曼罗兰创作、傅雷先生翻译的《名人传》，让我们从伟人的生涯中汲取生存的力量和战斗的勇气，更让我们明白：唯有真实的苦难，才能驱除罗曼蒂克式幻想的苦难；唯有克服苦难的悲剧，才能帮助我们担当起命运的磨难。读海伦·凯勒一个个真实而感人肺腑的故事，感受遭受不济命运的人所具备的自强不息和从容豁达，从而让我们在并非一帆风顺的人生道路上越走越勇，做命运真正的主宰者。在书籍的带领下，我们不断磨炼自己的意志，而我们的心灵也将渐渐充实成熟。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/394A48DD08594451B73441C6BFE1C363_1004273913-1_b_5.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">阅读能够荡涤浮躁的尘埃污秽，过滤出一股沁人心脾的灵新之气，甚至还可以营造出一种超凡脱俗的娴静氛围。读陶渊明的《饮酒》诗，体会“结庐在人境，而无车马喧”那种置身闹市却人静如深潭的境界，感悟作者高深、清高背后所具有的定力和毅力；读世界经典名著《巴黎圣母院》——让我们看到如此丑陋的卡西莫多却能够拥有善良美丽的心灵、淳朴真诚的品质、平静从容的气质和不卑不亢的风度，他的内心在时间的见证下折射出耀人的光彩，使我们在寻觅美的真谛的同时去追求心灵的高尚与纯洁。读王蒙的《宽容的哲学》、林语堂的《生活的艺术》以及古人流传于世的名言警句，这些都能使我们拥有诚实舍弃虚伪，拥有充实舍弃空虚，拥有踏实舍弃浮躁，平静而坦然地度过每一个晨曦每一个黄昏。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/8883A2FB6BAA47CD87947D447F9F1444_27850083-1_b_1.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">其实阅读的好处很多很多，阅读可以了解时事，增广见闻；丰富和补充知识；陶冶性情；增见识长学问，拓展思路，改变思维习惯，促进个人进步，消除寂寞，净化心灵、修身养性、休闲娱乐。同时可以刺激大脑神经的发展，使你的大脑不会退化 ，增强思考能力等等。阅读最大的好处是可以丰富别人偷不走，抢不掉的知识。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/8105A6FB2FC5474FA9B03FA4B7B06253_25346648-1_b_2.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">研究发现义大利文盲和读过五年书的老人，在老人失智症上的比例是十四比一，也就是说，没有阅读的老年人得老人失智症的机会比有阅读的人多了14倍。
                自小老师就对我们说：「书中自有黄金屋」·「足不出户，而知天下事」等名句激励我们；并且还说作文能力的加强 – 学生的写作能力的高低，与他读书的多少成正比。关键提升考试成绩。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/3574B1BAF15A4A42A3B12ADB981183EA_25060183-1_b_3.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">古人说，「开卷有益」，就是告诉我们阅读有很多的好处，所以我们要好好读书，将来才会有成就。多阅读可以充实自己，多读书可以增加知识，多阅读更可以增广见闻。</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/394A48DD08594451B73441C6BFE1C363_1004273913-1_b_5.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">1) 阅读是一种乐趣，可以纯享受
                2) 丰富和补充知识
                3) 了解时事，增广见闻； 「足不出户，而知天下事」
                4) 学习做人道理
                5) 陶冶性情(诗词古文)
                6) 阅读同时可以刺激大脑神经的发展，使你的大脑不会退化 ，增强思考能力</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/5601A7C3F41D4944816D9B8DAACF4842_27850945-1_b_29.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">阅读是丰富人生阅历的良好伴侣，通过阅读，我们可以借鉴他人的生活经历来使自己的人生变长，变宽。
                开卷有益 · 读书可使人愉悦，增加文采及充实才能。 －培根</p>
            </div>
          </div>
          <div class="item">
            <div class="img">
              <img src="${pageContext.request.contextPath}/book_img/773C2D3DC07742B98803F6499BD1DE98_26438798-1_b_1.jpg" alt="">
            </div>
            <div class="text">
              <h4>阅读的好处?</h4>
              <p class="data">2016-12-24 16:33:26</p>
              <p class="info-cont">阅读虽说不能改变我们的命运，却可以改变我们的性格；阅读不能改变人生的起点，但它却可以改变人生的终点，它可以丰富我们的思想，提高我们对生活的认识，丰富自己的精神世界，可使我们更加理性的看待现实问题。</p>
            </div>
          </div>
        </div>
        <div id="demo0" style="text-align: center;"></div>
      </div>
    </div>
  </div>
  <!-- 模版引擎导入 -->
  <!-- <script type="text/html" id="demo">
    {{# layui.each(d.listCont,function(index,item){}}
    <div class="item">
      <div class="img">
        <img src="../res/img/new1.jpg" alt="">
      </div>
      <div class="text">
        <h4>周岁内的宝宝消化不良拉肚子怎么办?</h4>
        <p class="data">2016-12-24 16:33:26</p>
        <p class="info-cont">宝宝在周岁之前体质相对较弱，特别是薄弱肠道，一不注意就会拉肚子;那么宝宝消化不良拉肚子</p>
      </div>
    </div>
    {{# })}}
  </script> -->
<script>
  layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','laypage'],function(){
      var
      mm = layui.mm,laypage = layui.laypage;
      laypage.render({
        elem: 'demo0'
        ,count: 100 //数据总数
      });
    // 模版引擎导入
     var html = demo.innerHTML;
     var listCont = document.getElementById('list-cont');
      mm.request({
        url: '../json/information.json',
        success : function(res){
          console.log(res)
          listCont.innerHTML = mm.renderHtml(html,res)
        },
        error: function(res){
          console.log(res);
        }
      })
});

</script>


</body>
</html>
