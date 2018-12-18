<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/17
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0052)http://v.bootstrapmb.com/2018/7/fsjud1659/index.html -->
<html class="" lang="en">
<!--<![endif]-->
<head>
    <jsp:include page="includes/ui/head.jsp"/>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
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
                        <table id="myTable">
                            <thead>
                                测试DataTable
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
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
                                    <a href="#">105</a></div>
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
                                        <a href="#">Bootstrap 字体图标</a></h2>
                                </div>
                                <div class="post-entry">
                                    <p>什么是字体图标
                                        所谓字体图标，就是使用字体（Font）格式的字形做成了图标。
                                        Bootstrap 自带的字体图标
                                        Bootstrap 捆绑了 200 多种字体格式的字形，在 fonts 文件夹内可以找到字体图标，它包含了下列这些文件：
                                        glyphicons-halflings-regular.eot&nbsp;......
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
                        <!-- END / POST -->
                        <!-- PAGINATION -->
                        <div class="pagination">
                            <a href="#" class="prev">« 上一页</a>
                            <a href="#" class="next">下一页 »</a></div>
                        <!-- END / PAGINATION --></div>
                </div>
                <!-- END / CONTENT -->

                <%--右边栏--%>
                <jsp:include page="includes/ui/right.jsp"/>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <jsp:include page="includes/ui/footer.jsp"/>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="/static/assets/ui/js/datatable.js"></script>
<script>
    $(function () {
        HandleDatatable.init({
            "url": "/content",
            "columns": [{"data": "id"},
                {"data": "typeId"},
                {"data": "title"},
                {"data": "authorId"},
                {"data": "pic"},
                {"data": "content"},
                {"data": "titleDesc"},
                {"data": "reads"},
                {"data": "updated"},
                {"data": "created"}]
        })
    })
</script>
</div>
</body>

</html>