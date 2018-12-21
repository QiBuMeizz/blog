<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
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
            <h2 class="home" style="color:lightgrey">评论管理</h2>
        </div>
        <div class="middle_content">
            <h3 style="color: floralwhite">审核评论</h3>
            <div class="entry">
                <div class="portlet-body form">
                    <form role="form" action="/back/comment/save" method="post" modelAttribute="user" id="commentForm">
                        <div class="form-body">
                            <input type="text" name="id" value="${requestScope.comment.id}" hidden>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="name" class="form-control" id="name" value="${requestScope.comment.name}" readonly>
                                <label for="name">类目名称</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="email" class="form-control" id="email" value="${requestScope.comment.email}" readonly>
                                <label for="email">邮箱</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="content.title" class="form-control" id="content.title" value="${requestScope.comment.content.title}" readonly>
                                <label for="content.title">所属文章标题</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="parentName" class="form-control" id="parentName" value="${requestScope.comment.parentName == null? '无父评论':requestScope.comment.parentName}" readonly>
                                <label for="parentName">父评论名称</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <textarea name="text" class="form-control" id="text" readonly>${requestScope.comment.text}</textarea>
                                <label for="text">评论内容</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="status" class="form-control" id="status" value="${requestScope.comment.status == 0? '未审核':'已审核'}" readonly>
                                <label for="status">状态</label>
                            </div>
                        </div>
                        <div style="padding-left: 20px">
                            <button type="button" class="btn blue btn-outline" onclick="pass()"><i class="fa fa-check">通过审核</i></button>
                            <a type="button" class="btn red btn-outline" href="/back/comment/delete?id=${requestScope.comment.id}"><i class="fa fa-close">拒绝发布</i></a>
                            <button type="button" class="btn default btn-outline" onclick="history.go(-1);"><i class="fa fa-mail-reply">返回</i></button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="treeModal" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">请选择</h4>
            </div>
            <div class="modal-body"> <ul id="treeDemo" class="ztree"></ul> </div>
            <div class="modal-footer">
                <button type="button" class="btn dark btn-outline" data-dismiss="modal">取消</button>
                <button type="button" class="btn green" data-dismiss="modal">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<%@include file="../../includes/back/metronij.jsp"%>
<script src="/static/assets/metronic/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/app/validate.js" type="text/javascript"></script>

<script>
    function pass() {
        //设置状态值
        $("#status").val(1);
        //提交表单
        $("#commentForm").submit();
    }

</script>
</body>
</html>
