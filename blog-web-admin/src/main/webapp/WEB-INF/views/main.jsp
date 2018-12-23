<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/17
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<!DOCTYPE html>
<!-- saved from url=(0052)http://v.bootstrapmb.com/2018/7/fsjud1659/index.html -->
<html class="">
<!--<![endif]-->
<head>
    <jsp:include page="includes/ui/head.jsp"/>
    <title>GW-Blog</title>

    <style type="text/css">

        .bg:hover{
            background-color: #E5E5E5;
            border: #E5E5E5 1px solid;
        }

    </style>
</head>
<body>

<!-- PAGE WRAP -->
<div id="page-wrap">
    <!-- HEADER -->
    <%--<jsp:include page="includes/ui/header.jsp"/>--%>
    <%@include file="includes/ui/header.jsp"%>
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

                        <form action="/main" id="searchForm" method="post">
                            <input type="hidden" name="current" id="current" value="${page.current}"/>
                            <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                        </form>
                        <c:forEach items="${list}" var="content">
                            <div class="post bg" onclick="content(${content.id});" style="cursor: pointer">
                                <div class="post-media">
                                    <div class="image-wrap"  style='height:400px;overflow: hidden;${content.pic == null || content.pic == "" ? "display:none":""}'>
                                            <%--图片--%>
                                        <img src="${content.pic}" style="margin: 0 0 -100px 0;" alt=""></div>
                                    <div class="post-cat">
                                            <%--详情跳转--%>
                                        <a href="/content?id=${content.id}">详情</a></div>
                                </div>
                                <div class="post-meta">
                                        <%--日期时间--%>
                                    <div class="post-date">
                                        <span class="year"><fmt:formatDate value="${content.updated}"
                                                                           pattern="yyyy"/> </span>
                                        <span class="month"><fmt:formatDate value="${content.updated}"
                                                                            pattern="MM"/></span>
                                        <span class="day"><fmt:formatDate value="${content.updated}"
                                                                          pattern="dd"/></span></div>
                                            <%--待实现--%>
                                    <%--<div class="post-comment">
                                        <i class="fa fa-comment"></i>
                                            &lt;%&ndash;评论数&ndash;%&gt;
                                        <a href="/content?id=${content.id}">${content.reads == null? '0':content.reads}</a>
                                    </div>--%>
                                </div>
                                <div class="post-body">
                                    <div class="post-title">
                                        <h2>
                                            <a href="/content?id=${content.id}">${content.title}</a></h2>
                                    </div>
                                    <div class="post-entry">
                                        <p>${content.titleDesc}
                                        </p>
                                    </div>
                                    <div class="post-author pull-right">
                                        <div class="image-thumb">
                                            <img src="${content.user.pic}" alt=""></div>
                                        <div class="name-author">
                                            <cite>作者:&nbsp;${content.user.username}</cite></div>
                                    </div>
                                </div>
                            </div><br>
                        </c:forEach>
                        <!-- END / POST -->
                        <!-- PAGINATION -->
                        <div class="pagination">
                            <%--<a href="#" class="prev">« 上一页</a>
                            <a href="#" class="next">下一页 »</a>--%>
                            <div class="row text-center">
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
</div>
 <jsp:include page="includes/ui/footer.jsp"/>
</body>
<script type="text/javascript">
    //这是跳转的逻辑
    function page(current) {
        //current跳转到哪一页  pageSize每页的条数
        $("#current").val(current);
        //window.location.href="/user/list?current="+current+"&pageSize="+pageSize;
        $("#searchForm").submit();
    }

    $(function () {
        //设置开关，判断是否要默认选中“最新文章”
        var flag=false;
        var local = location.href;
        $("#menu a").each(function () {
            if($(this).prop("href")===local ){
                $(this).parent().addClass("current-menu-parent");
                flag=true;
            }
        });
        $("#menu  .child").each(function () {
            if($(this).prop("href")===local ){
                $(this).closest(".col-md-1").addClass("current-menu-parent");
                flag=true;
            }
        });
        if(!flag){
            $("#menu li:first").addClass("current-menu-parent");
        }
        if (local == "http://localhost:8080/content?id=1"){
            $("#menu li:last").addClass("current-menu-parent");
        }
    });

    function content(id) {
        location.href="/content?id="+id;
    }
</script>

</html>