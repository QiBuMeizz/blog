<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../includes/back/header.jsp"%>
    <title>我的信息</title>
    <%@include file="../includes/back/metronic.jsp"%>
</head>
<body class="standard simple">
<!-- _________________________ Start Background Image __________________________ -->
<%@include file="../includes/back/background.jsp"%>
<!-- _________________________ Finish Background Image __________________________ -->

<!-- _________________________ Start Page ___________________________ -->

    <div id="middle">
        <div id="home">
            <h2 class="home" style="color:lightgrey">个人信息</h2>
        </div>
        <div class="middle_content">
            <h3 style="color: floralwhite">修改个人信息</h3>
            <div class="entry">
                <div class="portlet-body form">
                    <form role="form">
                        <div class="form-body">
                            <input type="text" id=" " hidden>
                            <div class="form-group form-md-line-input">
                                <input type="text" class="form-control" id="username" placeholder="请输入用户名" value="${user.username}">
                                <label for="username">用户名</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="password" class="form-control" id="password" placeholder="请输入密码，如不修改密码可不填">
                                <label for="password">密码</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" class="form-control" id="email" placeholder="请输入邮箱" value="${user.email}">
                                <label for="email">邮箱</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" class="form-control" id="phone" placeholder="请输入手机号" value="${user.phone}">
                                <label for="phone">手机号</label>
                            </div>

                        </div>
                        <div style="padding-left: 20px">
                            <button type="submit" class="btn blue btn-outline">提交</button>
                            <button type="button" class="btn default btn-outline">取消</button>
                        </div>
                    </form>
                </div>
            </div>

            </div>
        </div>
      
        <!-- _________________________ Start Footer _________________________ -->
        <%--<div id="footer">
            <p>Pacifico &copy; 2016 by 萌站</p>
        </div>--%>
        <!-- _________________________ Finish Footer ________________________ -->
<%@include file="../includes/back/metronij.jsp"%>
</body>
</html>
