<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%@include file="../includes/back/header.jsp"%>
        <title>我的博客</title>
        <!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  -->
    </head>
<body class="standard simple">
<!-- _________________________ Start Slider __________________________ -->
<ul id="sliderMotion">
    <li data-thumb="/static/assets/back/images/slider/thumbs/img1.jpg" data-start="top left" data-finish="bottom right" data-zoom="out" data-animation="10">
        <img src="/static/assets/back/images/slider/img1.jpg" alt="Banner Image 1" />
        <div class="cmsmsSlideCaption" data-top="50">
            <h2 style="color: lightgray">博客后台</h2>
            <p style="color: lightgray;font-weight:bold">我们这里只收怪物，不收普通人。</p>
            <a href="/main" class="button btn_1">点击进入博客主页</a>
        </div>
    </li>
    <li data-thumb="/static/assets/back/images/slider/thumbs/img2.jpg" data-start="bottom center" data-finish="center center" data-zoom="in" data-animation="20">
        <img src="/static/assets/back/images/slider/img2.jpg" alt="Banner Image 2" />
    </li>
    <li data-thumb="/static/assets/back/images/slider/thumbs/img3.jpg" data-start="top left" data-finish="bottom right" data-zoom="out" data-animation="10">
        <img src="/static/assets/back/images/slider/img3.jpg" alt="Banner Image 3" />
    </li>
    <li data-thumb="/static/assets/back/images/slider/thumbs/img4.jpg" data-start="center center" data-finish="top center" data-zoom="in" data-animation="15">
        <img src="/static/assets/back/images/slider/img4.jpg" alt="Banner Image 4" />
    </li>
    <li data-thumb="/static/assets/back/images/slider/thumbs/img5.jpg" data-start="center left" data-finish="top right" data-zoom="out" data-animation="15">
        <img src="/static/assets/back/images/slider/img5.jpg" alt="Banner Image 5" />
    </li>
</ul>
<!-- _________________________ Finish Slider __________________________ -->

<%@include file="../includes/back/menu.jsp"%>


<%@include file="../includes/back/footer.jsp"%>

</body>
</html>
