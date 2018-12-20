<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <title>我的信息</title>
    <%@include file="../../includes/back/metronic.jsp"%>
    <style type="text/css">
        table{
            color:lightgrey;
        }
        div a{
            color:lightgrey;
        }
    </style>
</head>
<body class="standard simple">
<!-- _________________________ Start Background Image __________________________ -->
<%@include file="../../includes/back/background.jsp"%>
<!-- _________________________ Finish Background Image __________________________ -->

<!-- _________________________ Start Page ___________________________ -->
<div id="middle" class="middle-width" style="width: 85%">
    <div id="home">
        <h2 class="home" style="color:lightgrey">博文管理</h2>
    </div>
    <div class="middle_content">
        <h3 style="color: floralwhite">博文列表</h3>
        <div class="entry">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <c:set var="list" value="${pageResult.data.list}"/>
                    <c:set var="page" value="${pageResult.data}"/>

                    <form action="/back/content/list" id="searchForm">
                        <input type="hidden" name="current" id="current" value="${page.current}"/>
                        <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                    </form>
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="table-checkbox">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="group-checkable"
                                           data-set="#sample_2 .checkboxes"/>
                                    <span></span>
                                </label>
                            </th>
                            <th> 文章标题</th>
                            <th> 作者</th>
                            <th> 标题描述</th>
                            <th> 阅读量</th>
                            <th> 更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="content">
                            <tr >
                                <td>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="group-checkable"
                                               data-set="#sample_2 .checkboxes"/>
                                        <span></span>
                                    </label>
                                </td>
                                <td>${content.title}</td>
                                <td>${content.user.username}</td>
                                <td>${content.titleDesc}</td>
                                <td>${content.reads}</td>
                                <td><fmt:formatDate value="${content.updated}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                                <td>
                                    <a type="button" href="/back/content/delete?id=${content.id}" class="btn red btn-outline">删除</a>
                                    <a type="button" href="/back/content/modify?id=${content.id}" class="btn blue btn-outline">修改</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                    <div class="row">
                        <sys:page count="${page.count}" current="${page.current}" pageSize="${page.pageSize}"></sys:page>
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
