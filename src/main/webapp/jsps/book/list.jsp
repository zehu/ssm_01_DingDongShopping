<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书列表</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
    href="<c:url value='/jsps/css/book/list.css'/>">
<link rel="stylesheet" type="text/css"
    href="<c:url value='/jsps/pager/pager.css'/>" />
<script type="text/javascript"
    <%-- src="<c:url value='/jsps/pager/pager.js'/>"></script>
<script type="text/javascript" --%>
    src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript"
    src="<c:url value='/jsps/js/book/list.js'/>"></script>
</head>

<body>
    <ul>
    <c:forEach items="${pb.beanList }" var="book">
        <li>
            <div class="inner">
                <a class="pic"
                    href="<c:url value='/book/load.do?bid=${book.bid }'/>"><img
                    src="<c:url value='/${book.image_b }'/>"
                    border="0" />
                </a>
                <p class="price">
                    <span class="price_n">&yen;${book.currPrice }</span> <span
                        class="price_r">&yen;${book.price }</span> (<span
                        class="price_s">${book.discount }折</span>)
                </p>
                <p>
                    <a id="bookname"
                        title="${book.bname }"
                        href="<c:url value='/book/load.do?bid=${book.bid }'/>">${book.bname }</a>
                </p>
                <%-- url标签会自动对参数进行url编码 --%>
                <c:url value="/book/findByAuthor.do" var="authorUrl">
                    <c:param name="author" value="${book.author }"></c:param>
                </c:url>
                <c:url value="/book/findByPress.do" var="pressUrl">
                    <c:param name="press" value="${book.press }"></c:param>
                </c:url>
                <p>
                    <a href="${authorUrl }" name='P_zz' title='${book.author }'>${book.author }</a>
                </p>
                <p class="publishing">
                    <span>出 版 社：</span><a href="${pressUrl }">${book.press }</a>
                </p>
                <p class="publishing_time">
                    <span>出版时间：</span>${book.publishtime }
                </p>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </li>

     </c:forEach>
    </ul>

    <div style="text-align: center; float:left; width:100%;">
        <hr />
        <br />
        <%@include file="/jsps/pager/pager.jsp"%>
    </div>

</body>

</html>

