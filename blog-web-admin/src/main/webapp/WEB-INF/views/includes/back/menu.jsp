<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- _________________________ Start Page ___________________________ -->
<div id="page" class="hideContent">
    <!-- _________________________ Start Header _________________________ -->
    <div class="header_wrap">
        <div id="header">
            <div class="header_inner">
                <a class="logo" title="六花" href="/back/info">
                    <img alt="六花" src="/static/assets/back/images/logo.png" />

                </a>
                <!-- _________________________ Start Navigation _____________________ -->
                <div class="navigation_wrap">
                    <ul id="navigation">
                        <br>
                        <br>
                        <li><a href="/back/main">首页<span>home</span></a></li>
                        <li><a href="/back/info">我的信息<span>information</span></a></li>
                        <li><a href="/back/content/list">博文管理<span>article management</span></a></li>

						<li><a href="/back/type/list">分类管理<span>Classification management</span></a></li>
 						<li><a href="/back/comment/list">评论管理<span>comments management</span></a></li>
 						<li class="${sessionScope.user.role ? '': 'hidden'}"><a href="${sessionScope.user.role ? '/back/admin/user/list': '#'}">管理员管理<span>admin-user management</span></a></li>
                        <li><a href="/main">关于我们<span>about us</span></a></li>
                        <li><a href="/back/logout">注销<span>logout</span></a></li>
                    </ul>
                </div>
                <!-- _________________________ Finish Navigation ____________________ -->

            </div>
            <div class="header_arrow_wrap">
                <a href="#" class="header_arrow"><span>&nbsp;</span></a>
            </div>
        </div>
    </div>
    <!-- _________________________ Finish Header ________________________ -->

</div>
<!-- _________________________ Finish Page __________________________ -->
