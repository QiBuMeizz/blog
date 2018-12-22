<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <link href="https://cdn.bootcss.com/zTree.v3/3.5.33/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css"/>
    <title>分类管理</title>
</head>
<body class="standard simple bodyBack">

<div class="bgImage">
    <img src="/static/assets/back/images/subpage_bg.jpg" alt="" />
</div>

<div id="page" class="background">
    <%@include file="../../includes/back/background.jsp"%>
    <div id="middle">
        <div id="home">
            <h2 class="home" style="color:lightgrey">分类管理</h2>
        </div>
        <div class="middle_content">
            <h3 style="color: floralwhite">${requestScope.type.id == null ? "新增" : "修改"}分类</h3>
            <div class="entry">
                <div class="portlet-body form">
                    <form role="form" action="/back/type/save" method="post" modelAttribute="user" id="inputForm">
                        <div class="form-body">
                            <input type="text" name="id" value="${requestScope.type.id}" hidden>
                            <div class="form-group form-md-line-input">
                                <input type="text" id="parentName" name="tname" class="form-control" placeholder="若无父类，留空" value="${requestScope.type.tname}" readonly data-toggle="modal" href="#zModel"  style="cursor: pointer">
                                <input type="text" id="parentId" name="parentId" class="form-control" value="${requestScope.type.parentId}">
                                <label for="parentName">父类名称</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="name" class="form-control required" id="name" placeholder="请输入类目名称" value="${requestScope.type.name}">
                                <label for="name">类目名称</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="sortOrder" class="form-control required" id="sortOrder" placeholder="请输入排列序号" value="${requestScope.type.sortOrder}">
                                <label for="sortOrder">排列序号</label>
                            </div>
                        </div>

                        <div style="padding-left: 20px">
                            <button type="submit" class="btn blue btn-outline">提交</button>
                            <a href="/back/type/list" type="button" class="btn default btn-outline">返回</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="../../includes/back/metronij.jsp"%>
<script src="/static/assets/metronic/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/app/validate.js" type="text/javascript"></script>
<script src="https://cdn.bootcss.com/zTree.v3/3.5.32/js/jquery.ztree.core.min.js"></script>
<script src="/static/assets/metronic/assets/apps/model/ztree.js"></script>
<script>
    var parentId;
    var parentName;

    $(function () {
        ZTree.initZTree("/back/type/tree", function (event, treeId, treeNode, clickFlag) {
            parentId = treeNode.id;
            parentName = treeNode.name;
        });
        Validate.init();
    })

    // 保存按钮
    function checkIn() {
        $("#parentId").val(parentId);
        $("#parentName").val(parentName);
    }

    // 关闭按钮
    function clean() {
        $("#parentId").val(0);
        $("#parentName").val("");
    }

</script>
</body>
</html>
