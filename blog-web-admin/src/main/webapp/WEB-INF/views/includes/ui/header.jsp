<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/17
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="header">
    <div class="container">
        <!-- LOGO -->
        <div class="logo text-center">
            <a href="#">
                <img src="/static/assets/ui/home/gw-logo.png" alt=""></a>
        </div>
        <!-- END / LOGO -->
    </div>
    <!-- NAVIGATION -->
    <nav class="pi-navigation" data-menu-responsive="1200">
        <div class="container">
            <div class="open-menu" style="display: none;">
                <span class="item item-1"></span>
                <span class="item item-2"></span>
                <span class="item item-3"></span>
            </div>
            <div class="close-menu"></div>


            <ul id="menu" class="navlist" style="height: auto;">
                <li class="col-md-1">
                    <a href="/main">最新文章</a>
                </li>
                <c:forEach items="${requestScope.baseResult.data}" var="type">
                    <c:if test="${type.parentId == 0}">
                        <%--当前高亮的导航 current-menu-parent--%>
                        <li class="col-md-1">
                            <a href="/main?typeId=${type.id}">${type.name}</a>
                            <c:if test="${type.isParent}">
                                <ul class="sub-menu">
                                    <c:forEach items="${requestScope.baseResult.data}" var="child">
                                        <c:if test="${child.parentId == type.id}">
                                            <li>
                                                <a class="child" href="/main?typeId=${child.id}">${child.name}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
            <div class="search-box">
            <span class="icon-search">
              <i class="fa fa-search"></i>
            </span>
                <form action="/main">
                    <input type="search" name="title" value="搜索">
                </form>
            </div>
        </div>
    </nav>
    <!-- END / NAVIGATION -->
</header>
