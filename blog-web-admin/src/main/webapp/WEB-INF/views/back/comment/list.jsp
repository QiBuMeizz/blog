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
        <h3 style="color: floralwhite; float:left">评论列表</h3>
        <c:set var="list" value="${pageResult.data.list}"/>
        <c:set var="page" value="${pageResult.data}"/>
        <div class="row table">
            <button class="btn red btn-outline mt-sweetalert pull-right margin-top-20"
                    data-title="温馨提示"
                    data-message="确定删除所选的多条数据项吗?"
                    data-type="warning" data-show-confirm-button="true"
                    data-confirm-button-class="btn-danger"
                    data-show-cancel-button="true"
                    data-cancel-button-class="btn-default"
                    data-close-on-confirm="false"
                    data-close-on-cancel="false"
                    data-confirm-button-text='确定'
                    data-cancel-button-text='取消'
                    data-popup-title-success="删除成功"
                    data-popup-message-success="所选数据已从数据表中移除."
                    data-post-url = "/back/comment/delete"
                    data-popup-title-cancel="已取消"
                    data-popup-message-cancel="已取消删除所选数据项."><i class="fa fa-trash-o">多选删除</i></button>
            <button type="button" href="/back/content/modify" class="btn green btn-outline pull-right margin-top-20"
                    onclick="$('#search').slideToggle(300)"><i class="fa fa-search">高级搜索</i>
            </button>
        </div>
        <div class="col-md-offset-1" id="search"
        ${comment.name != '' || comment.text !='' || comment.content.title !='' ? '':'hidden'}
        ${comment.name == null && comment.text ==null && comment.content.title ==null ? 'hidden':''}>
            <form role="form" action="/back/comment/list" method="post" class="echo" id="searchForm">
                <input type="hidden" name="current" id="current" value="${page.current}"/>
                <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                <h4 style="color: floralwhite ;">高级搜索</h4>
                <div class="form-body row">
                    <div class="form-group form-md-line-input col-md-3">
                        <input type="text" name="name" class="form-control" placeholder="评论者" value="${comment.name}">
                    </div>
                    <div class="form-group form-md-line-input col-md-3">
                        <input type="text" name="text" class="form-control" placeholder="评论内容" value="${comment.text}">
                    </div>

                    <div class="form-group form-md-line-input col-md-3">
                        <input type="text" name="content.title" class="form-control" placeholder="评论文章" value="${comment.content.title}">
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

                    <table class="table echo" width="50%" style="table-layout:fixed">
                        <thead>
                        <tr style="white-space:nowrap">
                            <th class="table-checkbox" width="3%">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">

                                    <input type="checkbox" class="group-checkable" id="father"
                                           data-set="#sample_2 .checkboxes"/>
                                    <span></span>
                                </label>
                            </th>
                            <th width="7%"> 评论者</th>
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
                                <td width="3%">
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="group-checkable children" value="${comment.id}"
                                               data-set="#sample_2 .checkboxes"/>
                                        <span></span>
                                    </label>
                                </td>
                                <td class="tableFix" width="7%">${comment.name}</td>
                                <td>${comment.email}</td>
                                <td class="tableFix">${comment.text}</td>
                                <td>${comment.content.title}</td>
                                <td>${comment.status == 0?'未审核':'已审核'}</td>
                                <td><fmt:formatDate value="${comment.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>
                                    <a href="/back/comment/form?id=${comment.id}" class="btn blue btn-outline"><i class="fa fa-edit">详情</i></a>
                                    <a href="/back/comment/save?id=${comment.id}" class="btn yellow btn-outline"><i class="fa fa-check">通过</i></a>
                                    <button class="btn red btn-outline mt-sweetalert"
                                            data-title="温馨提示"
                                            data-message="确定删除所选的多条数据项吗?"
                                            data-type="warning" data-show-confirm-button="true"
                                            data-confirm-button-class="btn-danger"
                                            data-show-cancel-button="true"
                                            data-cancel-button-class="btn-default"
                                            data-close-on-confirm="false"
                                            data-close-on-cancel="false"
                                            data-confirm-button-text='确定'
                                            data-cancel-button-text='取消'
                                            data-popup-title-success="删除成功"
                                            data-popup-message-success="所选数据已从数据表中移除."
                                            data-get-url = "/back/comment/delete?id=${comment.id}&parentId=${comment.parentId}"
                                            data-popup-title-cancel="已取消"
                                            data-popup-message-cancel="已取消删除所选数据项.">
                                        <i class="fa fa-trash">删除</i></button>
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
