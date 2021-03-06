<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header_wrap">
    <div id="header">
        <div class="header_inner">
            <a class="logo" title="Pacifico" href="#">
                <img alt="Pacifico" src="/static/assets/back/images/logo.png" />
            </a>

            <div class="navigation_wrap">
                <ul id="navigation">
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
        </div>
    </div>
</div>


