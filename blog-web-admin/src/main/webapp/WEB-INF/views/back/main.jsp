<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%@include file="../includes/back/header.jsp"%>
        <title>我的博客</title>
        <!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  -->
        <style>
            .blog-tips {
                margin-left: 264px;
                margin-top: 10px;
                background-color: #333333;
                width: 230px;
            }
            .simple {
                background-color: #AFB1B3;
                background-image: url("/static/assets/back/images/loader.gif");
            }
        </style>
    </head>
<body class="simple">
        <div class="blog-tips">
            <h3 style="color: lightgray;padding: 10px;">博客后台</h3>
            <p style="color: lightgray;font-weight:bold;padding: 10px;">我们这里只收怪物，不收普通人。</p>
        </div>

<%@include file="../includes/back/menu.jsp"%>


<%@include file="../includes/back/footer.jsp"%>

</body>
</html>
