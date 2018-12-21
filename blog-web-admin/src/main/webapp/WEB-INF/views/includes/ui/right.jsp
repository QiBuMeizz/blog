<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/18
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3">
    <div class="sidebar sidebar-right">
        <!-- WIDGET ABOUT -->
        <div class="widget widget_about">
            <h4>关于我们</h4>
            <div class="author-thumb">
                <img src="/static/assets/ui/home/LOGO5.png" alt=""></div>
            <h3 class="author-name text-uppercase">
                <a href="#" onclick="searchSoon('关于我们')">GW 工作组</a></h3>
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
        <%--<div class="widget widget_latest_post">
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
        </div>--%>
        <!-- END / WIDGET LATEST POST -->

        <!-- WIDGET TAG CLOUD -->
        <div class="widget widget_tag_cloud">
            <h4>标签索引</h4>
            <div class="tagcloud">
                <form action="/main" id="searchSoon">
                    <input type="hidden" id="inputSoon" name="title">
                    <a href="#" onclick="searchSoon('Java')">Java</a>
                    <a href="#" onclick="searchSoon('C++')">C++</a>
                    <a href="#" onclick="searchSoon('python')">python</a>
                    <a href="#" onclick="searchSoon('微服务')">微服务</a>
                    <a href="#" onclick="searchSoon('数据库')">数据库</a>
                    <a href="#" onclick="searchSoon('Javascript')">Javascript</a>
                    <a href="#" onclick="searchSoon('maven')">maven</a>
                    <a href="#" onclick="searchSoon('bootstrap')">bootstrap</a>
                    <a href="#" onclick="searchSoon('虚拟机')">虚拟机</a>
            </div>
        </div>
        <!-- END / WIDGET TAG CLOUD --></div>
</div>
