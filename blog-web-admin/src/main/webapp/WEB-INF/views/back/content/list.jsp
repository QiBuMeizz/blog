<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <link rel="stylesheet" type="text/css" href="/static/assets/ui/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/assets/ui/font-awesome/css/font-awesome.min.css">
    <!-- PAGE STYLE -->
    <link rel="stylesheet" type="text/css" href="/static/assets/ui/home/style.css">
    <link rel="stylesheet" type="text/css" href="/static/assets/metronic/assets/global/plugins/bootstrap-sweetalert/sweetalert.css">
    <title>博文管理</title>

</head>
<body class="standard simple bodyBack">
<%@include file="../../includes/back/background.jsp"%>
<div id="page" class="background">
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
                <a type="button" href="#"
                   class="btn red btn-outline pull-right margin-top-20 "><i class="fa fa-trash-o">多选删除</i></a>
                <a type="button" href="/back/content/modify"
                   class="btn yellow btn-outline pull-right margin-top-20 "><i class="fa fa-plus">新增文章</i></a>
                <button type="button" href="/back/content/modify"
                   class="btn green btn-outline pull-right margin-top-20 " onclick="$('#searchForm').slideToggle(300)"><i class="fa fa-search">高级搜索</i></button>
            </div>
            <div class="col-md-offset-2" id="searchForm" hidden>
                <form role="form" action="/back/content/list" method="get" class="echo">
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
                        <table class="table echo">
                            <thead>
                            <tr style="white-space:nowrap">
                                <th class="table-checkbox">
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
                                    <td>
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="group-checkable children"
                                                   data-set="#sample_2 .checkboxes"/>
                                            <span></span>
                                        </label>
                                    </td>
                                    <td>${content.title}</td>
                                    <td>${content.user.username}</td>
                                    <td>${content.titleDesc}</td>
                                    <td>${content.reads}</td>
                                    <td><fmt:formatDate value="${content.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <a type="button" href="/back/content/modify?id=${content.id}"
                                           class="btn blue btn-outline"><i class="fa fa-edit">编辑</i></a>
                                        <a type="button" href="/back/content/delete?id=${content.id}"
                                           class="btn red btn-outline"><i class="fa fa-trash">删除</i></a>
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
<!-- LOAD JQUERY -->
<script type="text/javascript" src="/static/assets/ui/home/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/jquery.owl.carousel.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/jquery.tweet.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/retina.min.js"></script>
<script type="text/javascript" src="/static/assets/ui/home/scripts.js"></script>
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
