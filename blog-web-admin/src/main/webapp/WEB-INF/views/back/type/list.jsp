<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../includes/back/header.jsp" %>
    <title>分类管理</title>
    <link href="/static/assets/metronic/assets/apps/plugins/themes/vsStyle/treeTable.min.css" rel="stylesheet" type="text/css" />

</head>
<body class="standard simple bodyBack">
<%@include file="../../includes/back/background.jsp" %>
<div id="page" class="background echo">
    <div id="middle" class="middle-width" style="width: 85%;height: auto">
        <div id="home">
            <h2 class="home" style="color:lightgrey">分类管理</h2>
        </div>
    <div class="middle_content">
        <h3 style="color: floralwhite;float:left">分类列表</h3>
        <br><br><br>
        <a type="button" href="/back/type/form"
           class="btn yellow btn-outline pull-right margin-top-20"><i class="fa fa-plus">新增分类</i></a>
        <div class="entry">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <table class="table" id="treeTable">
                        <thead>
                            <tr style="white-space:nowrap">
                                <th width="5%" > ID </th>
                                <th width="19%"> 类目名称 </th>
                                <th width="19%"> 状态 </th>
                                <th width="19%"> 排列序号 </th>
                                <th width="19%"> 更新时间 </th>
                                <th width="19%"> 操作 </th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${list}" var="type">
                                <tr id="${type.id}" pId="${type.parentId}" style="white-space:nowrap">
                                    <td width="5%" >${type.id}</td>
                                    <td width="19%">${type.name}</td>
                                    <td width="19%">${type.status}</td>
                                    <td width="19%">${type.sortOrder}</td>
                                    <td width="19%"><fmt:formatDate value="${type.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td width="19%">
                                        <a href="/back/type/form?id=${type.id}" type="button" class="btn blue btn-outline"><i class="fa fa-edit">编辑</i></a>
                                        <button class="btn blue btn-outline red mt-sweetalert" +
                                                data-title="确认删除吗？" +
                                                data-type="info"  +
                                                data-show-confirm-button="true" +
                                                data-confirm-button-class="btn-success" +
                                                data-show-cancel-button="true" +
                                                data-cancel-button-class="btn-default" +
                                                data-close-on-confirm="false" +
                                                data-close-on-cancel="false" +
                                                data-confirm-button-text="删除" +
                                                data-cancel-button-text="取消" +
                                                data-popup-title-success="已删除" +
                                                data-popup-title-cancel="已取消" +
                                                data-get-url="/back/type/delete?id=${type.id}"><i class="fa fa-trash-o">删除</i></button>
                                        <c:if test="${type.parentId == 0}">
                                            <a href="/back/type/form?parentId=${type.id}" type="button" class="btn green btn-outline"><i class="fa fa-plus">添加下级菜单</i></a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="../../includes/back/metronij.jsp" %>
<script src="/static/assets/metronic/assets/apps/plugins/jquery.treeTable.min.js" type="text/javascript"></script>
<script>
    $(function(){
        $("#treeTable").treeTable({
            "column": 1,
            "expandLevel": 1
        });
    })
</script>
</body>
</html>
