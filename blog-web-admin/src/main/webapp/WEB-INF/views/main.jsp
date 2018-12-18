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
                                        <a href="http://v.bootstrapmb.com/2018/7/fsjud1659/index.html#">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                        <a href="http://v.bootstrapmb.com/2018/7/fsjud1659/index.html#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                        <a href="http://v.bootstrapmb.com/2018/7/fsjud1659/index.html#">
                                            <i class="fa fa-weixin"></i>
                                        </a>
                                        <a href="http://v.bootstrapmb.com/2018/7/fsjud1659/index.html#">
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
                <!-- SIDEBAR -->
                <div class="col-md-3">
                    <div class="sidebar sidebar-right">
                        <!-- WIDGET ABOUT -->
                        <div class="widget widget_about">
                            <h4>关于我们</h4>
                            <div class="author-thumb">
                                <img src="/static/assets/ui/home/LOGO5.png" alt=""></div>
                            <h3 class="author-name text-uppercase">
                                <a href="#">GW 工作组</a></h3>
                            <div class="desc">
                                <p>
                                    GW工作组是一个由五人组成的团队,</br>
                                    成立于2018年11月15日,</br>
                                    我们是一支高效,团结的优秀团队.
                                </p>
                            </div>
                            <div class="about-social">
                                加入我们:
                                <a href="#">
                                    <i class="fa fa-weixin"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-qq"></i>
                                </a>
                            </div>
                        </div>
                        <!-- END / WIDGET ABOUT -->
                        <!-- WIDGET LATEST POST -->
                        <div class="widget widget_latest_post">
                            <h4>最新文章</h4>
                            <ul>
                                <li>
                                    <div class="image-wrap">
                                        <img src="/static/assets/ui/home/1(3).jpg" alt=""></div>
                                    <div class="content-text">
                                        <a href="#">MVC 设计思想</a></br>
                                        <span class="date">Jan 10, 2014</span></div>
                                </li>
                                <li>
                                    <div class="image-wrap">
                                        <img src="/static/assets/ui/home/2(4).jpg" alt=""></div>
                                    <div class="content-text">
                                        <a href="#">HashSet 和 HashMap 区别</a>
                                        <span class="date">Jan 10, 2014</span></div>
                                </li>
                                <li>
                                    <div class="image-wrap">
                                        <img src="/static/assets/ui/home/3(3).jpg" alt=""></div>
                                    <div class="content-text">
                                        <a href="#">线程池的几种方式与使用场景</a>
                                        <span class="date">Jan 10, 2014</span></div>
                                </li>
                            </ul>
                        </div>
                        <!-- END / WIDGET LATEST POST -->

                        <!-- WIDGET TAG CLOUD -->
                        <div class="widget widget_tag_cloud">
                            <h4>标签索引</h4>
                            <div class="tagcloud">
                                <a href="#">Java</a>
                                <a href="#">C++</a>
                                <a href="#">python</a>
                                <a href="#">微服务</a>
                                <a href="#">数据库</a>
                                <a href="#">Javascript</a>
                                <a href="#">maven</a>
                                <a href="#">bootstrap</a>
                                <a href="#">虚拟机</a>
                            </div>
                        </div>
                        <!-- END / WIDGET TAG CLOUD --></div>
                </div>
                <!-- END / SIDEBAR --></div>
        </div>
    </section>
    <!-- BLOG MAIN CONTENT -->
    <!-- FOOTER -->
    <footer id="footer" class="footer">
        <div class="copyright text-center">
            <p>Copyrights © 2018 All Rights Reserved by GW工作组</p>
        </div>
    </footer>
    <!-- END / FOOTER --></div>
<!-- END / PAGE WRAP -->
<!-- LOAD JQUERY -->
<script type="text/javascript" src="/static/assets/ui/home/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/jquery.owl.carousel.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/jquery.tweet.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/retina.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/scripts.js"></script>
</body>

</html>