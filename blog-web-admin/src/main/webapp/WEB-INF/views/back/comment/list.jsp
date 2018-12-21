<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <title>评论管理</title>
</head>
<body class="standard simple bodyBack">
<%@include file="../../includes/back/background.jsp"%>
<div id="page" class="background">
    <div id="middle" class="middle-width" style="width: 85%;height: auto">
    <div id="home">
        <h2 class="home" style="color:lightgrey">评论管理</h2>
    </div>
    <div class="middle_content">
        <h3 style="color: floralwhite">评论列表</h3>
            <br><br><br>
        <div class="entry">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <c:set var="list" value="${CommentpageResult.data.list}"/>
                    <c:set var="page" value="${CommentpageResult.data}"/>

                    <form action="/back/comment/list" id="searchForm">
                        <input type="hidden" name="current" id="current" value="${page.current}"/>
                        <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                    </form>
                    <table class="table  ">
                        <thead>
                        <tr>
                            <th class="table-checkbox">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="group-checkable"
                                           data-set="#sample_2 .checkboxes"/>
                                    <span></span>
                                </label>
                            </th>
                            <th> 评论者</th>
                            <th> 评论者邮箱</th>
                            <th> 评论内容</th>
                            <th> 文章标题</th>
                            <th> 评论状态</th>
                            <th> 更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="comment">
                            <tr >
                                <td>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="group-checkable"
                                               data-set="#sample_2 .checkboxes"/>
                                        <span></span>
                                    </label>
                                </td>
                                <td>${comment.name}</td>
                                <td>${comment.email}</td>
                                <td width="40%">${comment.text}</td>
                                <td>${comment.content.title}</td>
                                <td>${comment.status == 1 ? "已审核" : "未审核"}</td>
                                <td><fmt:formatDate value="${comment.updated}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                                <td>
                                    <button type="submit" class="btn blue btn-outline">修改</button>
                                    <a href="/back/comment/delete?id=${comment.id}" type="submit" class="btn red btn-outline">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                        </table><br><br><br>
                    <div class="row">
                        <sys:page count="${page.count}" current="${page.current}" pageSize="${page.pageSize}"></sys:page>
                    </div>
                </div>

            </div>
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
<script>
    function page(current) {
        //current跳转到哪一页  pageSize每页的条数
        $("#current").val(current);
        //window.location.href="/user/list?current="+current+"&pageSize="+pageSize;
        $("#searchForm").submit();
    }
</script>
</body>
</html>
