<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <title>博文管理</title>

</head>
<body class="standard simple bodyBack">
<%@include file="../../includes/back/background.jsp"%>
<div id="page" class="background" >
    <div id="middle" class="middle-width" style="width: 85%;height: auto">
        <div id="home">
            <h2 class="home" style="color:lightgrey">博文管理</h2>
        </div>
        <div class="middle_content">
            <h3 style="color: floralwhite ;float:left">博文列表</h3>
            <br><br><br>
            <c:set var="list" value="${pageResult.data.list}"/>
            <c:set var="page" value="${pageResult.data}"/>
            <div class="row table">
                <button class="btn red btn-outline mt-sweetalert pull-right  margin-top-20"
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
                        data-post-url = "/back/content/delete"
                        data-popup-title-cancel="已取消"
                        data-popup-message-cancel="已取消删除所选数据项.">
                <i class="fa fa-trash-o">多选删除</i></button>
                <a type="button" href="/back/content/modify"
                   class="btn yellow btn-outline pull-right margin-top-20 "><i class="fa fa-plus">新增文章</i></a>
                <button type="button" href="/back/content/modify"
                   class="btn green btn-outline pull-right margin-top-20 " onclick="$('#search').slideToggle(300)"><i class="fa fa-search">高级搜索</i></button>
            </div>
            <div class="col-md-offset-2" id="search"  hidden>
                <form role="form" action="/back/content/list" id="searchForm" method="get" class="echo">
                    <input type="hidden" name="current" id="current" value="${page.current}"/>
                    <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                    <h4 style="color: floralwhite ;">高级搜索</h4>
                    <div class="form-body row">
                        <div class="form-group form-md-line-input col-md-3">
                            <input type="text" name="title" class="form-control required" placeholder="标题">
                        </div>
                        <div class="form-group form-md-line-input col-md-3">
                            <input type="text" name="content" class="form-control required" placeholder="内容">
                        </div>
                        <div style="padding-left: 20px">
                            <button type="submit" class="btn blue btn-outline btn-lg"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>

            <br>
            <div class="entry">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <table class="table echo" style="table-layout:fixed">
                            <thead>
                            <tr style="white-space:nowrap">
                                <th class="table-checkbox" width="3%">
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="group-checkable" id="father"
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
                                <tr style="white-space:nowrap">
                                    <td width="3%">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="group-checkable children"
                                                   data-set="#sample_2 .checkboxes" value="${content.id}"/>
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>${content.title}</td>
                                    <td>${content.user.username}</td>
                                    <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${content.titleDesc}</td>
                                    <td>${content.reads}</td>
                                    <td><fmt:formatDate value="${content.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <a type="button" href="/back/content/modify?id=${content.id}"
                                           class="btn blue btn-outline"><i class="fa fa-edit">编辑</i></a>
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
                                                data-get-url = "/back/content/delete?id=${content.id}"
                                                data-popup-title-cancel="已取消"
                                                data-popup-message-cancel="已取消删除所选数据项.">
                                            <i class="fa fa-trash">删除</i></button>
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

    <%@include file="../../includes/back/metronij.jsp" %>

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
