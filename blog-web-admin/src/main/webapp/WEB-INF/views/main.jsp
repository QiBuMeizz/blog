<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/17
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<!DOCTYPE html>
<!-- saved from url=(0052)http://v.bootstrapmb.com/2018/7/fsjud1659/index.html -->
<html class="" lang="en">
<!--<![endif]-->
<head>
    <jsp:include page="includes/ui/head.jsp"/>
    <title>GW-Blog</title>
</head>
<body>

<!-- PAGE WRAP -->
<div id="page-wrap">
    <!-- HEADER -->
    <jsp:include page="includes/ui/header.jsp"/>
    <!-- END / HEADER -->

    <%--博客内容--%>
    <!-- BLOG MAIN CONTENT -->
    <section class="blog-content blog-standard">
        <div class="container">
            <div class="row">
                <%--左边栏--%>

                <!-- CONTENT -->
                <div class="col-md-9">
                    <div class="content" style="margin-right: 100px;">


                        <c:set var="list" value="${pageResult.data.list}"/>
                        <c:set var="page" value="${pageResult.data}"/>

                        <form action="/main" id="searchForm">
                            <input type="hidden" name="current" id="current" value="${page.current}"/>
                            <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                        </form>
                        <c:forEach items="${list}" var="content">
                        <!-- POST -->
                        <div class="post">
                            <div class="post-media">
                                <div class="image-wrap">
                                    <%--图片--%>
                                    <img src="/static/assets/ui/home/25.jpg" alt=""></div>
                                <div class="post-cat">
                                    <%--详情跳转--%>
                                    <a href="#">详情</a></div>
                            </div>
                            <div class="post-meta">
                                <div class="post-format">
                                    <a href="#">
                                        <i class="fa fa-image"></i>
                                    </a>
                                </div>
                                <%--日期时间--%>
                                <div class="post-date">
                                    <span class="year">2015</span>
                                    <span class="month">Mar</span>
                                    <span class="day">14</span></div>
                                <div class="post-comment">
                                    <i class="fa fa-comment"></i>
                                    <%--评论数--%>
                                    <a href="#">${content.reads}</a></div>
                            </div>
                            <div class="post-body">
                                <div class="post-author">
                                    <div class="image-thumb">
                                        <img src="/static/assets/ui/home/LOGO2.png" alt=""></div>
                                    <div class="name-author">
                                        <cite>GW工作组</cite></div>
                                </div>
                                <div class="post-title">
                                    <h2>
                                        <a href="#">${content.title}</a></h2>
                                </div>
                                <div class="post-entry">
                                    <p>${content.titleDesc}
                                    </p>
                                </div>
                                <div class="post-link">
                                    <a href="#" class="pi-btn">阅读更多</a></div>
                                <div class="post-share">
                                    <span class="share-toggle pi-btn">
                                      <i class="fa fa-share-alt"></i>
                                    </span>
                                    <div class="share">
                                        <a href="#">
                                            <i class="fa fa-weixin"></i>
                                        </a>
                                        <a href="#">
                                            <i class="fa fa-qq"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- END / POST -->
                        <!-- PAGINATION -->
                        <div class="pagination">
                            <%--<a href="#" class="prev">« 上一页</a>
                            <a href="#" class="next">下一页 »</a>--%>
                            <div class="row">
                            <sys:page count="${page.count}" current="${page.current}" pageSize="${page.pageSize}"></sys:page>
                            </div>
                        </div>
                        <!-- END / PAGINATION -->
                    </div>
                </div>
                <!-- END / CONTENT -->

                <%--右边栏--%>
                <jsp:include page="includes/ui/right.jsp"/>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <jsp:include page="includes/ui/footer.jsp"/>
</div>
</body>
<script type="text/javascript">
    //这是跳转的逻辑
    function page(current) {
        //current跳转到哪一页  pageSize每页的条数
        $("#current").val(current);
        //window.location.href="/user/list?current="+current+"&pageSize="+pageSize;
        $("#searchForm").submit();
    }
</script>

</html>