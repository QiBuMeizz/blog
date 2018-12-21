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

<div id="page" class="background ">
    <div id="middle" class="middle-width" style="width: 85%;height: auto">
    <div id="home">
        <h2 class="home" style="color:lightgrey">评论管理</h2>
    </div>
    <div class="middle_content">
        <h3 style="color: floralwhite">评论列表</h3>
        <br>
        <c:set var="list" value="${pageResult.data.list}"/>
        <c:set var="page" value="${pageResult.data}"/>
        <div class="row table">
            <a type="button" href="#" class="btn red btn-outline pull-right margin-top-20"><i class="fa fa-trash-o">多选删除</i></a>
            <button type="button" href="/back/content/modify" class="btn green btn-outline pull-right margin-top-20 "
                    onclick="$('#searchForm').slideToggle(300)"><i class="fa fa-search">高级搜索</i>
            </button>
        </div>
        <div class="col-md-offset-1" id="searchForm" hidden>
            <form role="form" action="/back/comment/list" method="get" class="echo">
                <input type="hidden" name="current" id="current" value="${page.current}"/>
                <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                <h4 style="color: floralwhite ;">高级搜索</h4>
                <div class="form-body row">
                    <div class="form-group form-md-line-input col-md-3">
                        <input type="text" name="name" class="form-control" placeholder="评论者">
                    </div>
                    <div class="form-group form-md-line-input col-md-3">
                        <input type="text" name="text" class="form-control" placeholder="评论内容">
                    </div>

                    <div class="form-group form-md-line-input col-md-3">
                        <input type="text" name="content.title" class="form-control" placeholder="评论文章">
                    </div>
                    <div style="padding-left: 20px">
                        <button type="submit" class="btn blue btn-outline btn-lg">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="entry">
            <div class="row">
                <div class="col-md-12 col-sm-12">

                    <table class="table echo mytable" width="50%">
                        <thead>
                        <tr style="white-space:nowrap">
                            <th class="table-checkbox">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">

                                    <input type="checkbox" class="group-checkable" id="father"
                                           data-set="#sample_2 .checkboxes"/>
                                    <span></span>
                                </label>
                            </th>
                            <th> 评论者</th>
                            <th> 评论者邮箱</th>
                            <th> 评论内容</th>
                            <th> 评论文章</th>
                            <th> 审核状态</th>
                            <th> 更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${list}" var="comment">
                            <tr style="white-space:nowrap" >
                                <td>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="group-checkable children"
                                               data-set="#sample_2 .checkboxes"/>
                                        <span></span>
                                    </label>
                                </td>
                                <td>${comment.name}</td>
                                <td>${comment.email}</td>
                                <td class="mytd" width="80%">${comment.text}</td>
                                <td>${comment.content.title}</td>
                                <td>${comment.status == 0?'未审核':'已审核'}</td>
                                <td><fmt:formatDate value="${comment.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>
                                    <a href="/back/comment/form?id=${comment.id}" class="btn blue btn-outline"><i class="fa fa-edit">详情</i></a>
                                    <a href="/back/comment/save?id=${comment.id}" class="btn yellow btn-outline"><i class="fa fa-check">通过审核</i></a>

                                    <a href="/back/comment/delete?id=${comment.id}" class="btn red btn-outline"><i class="fa fa-trash-o">删除</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table><br>
                    <div class="row">
                        <sys:page count="${page.count}" current="${page.current}" pageSize="${page.pageSize}"></sys:page>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>

<%@include file="../../includes/back/metronij.jsp"%>
<script>
    function page(current) {
        //current跳转到哪一页  pageSize每页的条数
        $("#current").val(current);
        //window.location.href="/user/list?current="+current+"&pageSize="+pageSize;
        $("#searchForm").submit();
    }
    $(function () {
        var father = $("#father");
        var children = $(".children");
        //全选功能
        father.change(function () {
            //console.log($(this).is(":checked"));
            $(".children").each(function () {
                $(this).prop("checked",father.is(":checked"));
            });
        });

        //取消全选功能
        children.change(function () {
            var flag = true;
            children.each(function () {
                if (!$(this).is(":checked")) {
                    flag = false;
                }
            });
            father.prop("checked",flag);
        });
    });


</script>
</body>
</html>
