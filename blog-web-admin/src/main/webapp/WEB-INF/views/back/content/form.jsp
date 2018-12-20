<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <title>内容管理</title>
    <%@include file="../../includes/back/metronic.jsp"%>
</head>
<body class="standard simple">
<!-- _________________________ Start Background Image __________________________ -->
<%@include file="../../includes/back/background.jsp"%>
<!-- _________________________ Finish Background Image __________________________ -->

<!-- _________________________ Start Page ___________________________ -->

<div id="middle">
    <div id="home">
        <h2 class="home" style="color:lightgrey">内容管理</h2>
    </div>
    <div class="middle_content">
        <h3 style="color: floralwhite">${content.id!=null?"修改":"添加"}内容</h3>
        <div class="entry">
            <div class="portlet-body form">
                <form role="form" action="/back/content/save" method="post" modelAttribute="content">
                    <div class="form-body">
                        <input type="text" name="id" value="${content.id}" hidden>
                        <div class="form-group form-md-line-input">
                            <input type="text" name="title" class="form-control" id="title" placeholder="请输入文章标题" value="${content.title}">
                            <label for="title">文章标题</label>
                        </div>
                        <div class="form-group form-md-line-input">
                            <input type="text" name="user.username" class="form-control" id="user" placeholder="请输入作者" value="${content.user.username}" readonly>
                            <label for="user">作者</label>
                        </div>
                        <div class="form-group form-md-line-input">
                            <input type="text" name="titleDesc" class="form-control" id="titleDesc" placeholder="请输入简介" value="${content.titleDesc}">
                            <label for="titleDesc">简介</label>
                        </div>
                        <div class="form-group form-md-line-input">
                            <input type="text" name="reads" class="form-control" id="reads" placeholder="请输入阅读量" value="${content.reads}" readonly>
                            <label for="reads">阅读量</label>
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
<%@include file="../../includes/back/metronij.jsp"%>
</body>
</html>
