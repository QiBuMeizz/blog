<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<html>
<head>
    <%@include file="../../../includes/back/header.jsp"%>
    <title>用户管理</title>

</head>
<body class="standard simple bodyBack">
<%@include file="../../../includes/back/background.jsp"%>
<div id="page" class="background" >
    <div id="middle" class="middle-width" style="width: 85%;height: auto">
        <div id="home">
            <h2 class="home" style="color:lightgrey">用户管理</h2>
        </div>
        <div class="middle_content">
            <h3 style="color: floralwhite ;float:left">用户列表</h3>
            <c:set var="list" value="${pageResult.data.list}"/>
            <c:set var="page" value="${pageResult.data}"/>
            <div class="row table">
                <a type="button" href="/back/admin/user/info"
                   class="btn yellow btn-outline pull-right margin-top-20 "><i class="fa fa-plus">新增用户</i></a>
                <button type="button" href="/back/admin/user/info"
                   class="btn green btn-outline pull-right margin-top-20 " onclick="$('#search').slideToggle(300)"><i class="fa fa-search">高级搜索</i></button>
            </div>
            <div class="col-md-offset-2" id="search"
                ${(user.username != null && user.username != '') || (user.phone != null && user.phone != '')
                || (user.email != null && user.email != '') ? '' : 'hidden'}>
                <form role="form" action="/back/admin/user/list" id="searchForm" method="post" class="echo">
                    <input type="hidden" name="current" id="current" value="${page.current}"/>
                    <input type="hidden" name="pageSize" id="pageSize" value="${page.pageSize}"/>
                    <h4 style="color: floralwhite ;">高级搜索</h4>
                    <div class="form-body row">
                        <div class="form-group form-md-line-input col-md-3">
                            <input type="text" name="username" class="form-control required" placeholder="用户名" value="${user.username}">
                        </div>
                        <div class="form-group form-md-line-input col-md-3">
                            <input type="text" name="email" class="form-control required" placeholder="邮箱" value="${user.email}">
                        </div>
                        <div class="form-group form-md-line-input col-md-3">
                            <input type="text" name="phone" class="form-control required" placeholder="电话" value="${user.phone}">
                        </div>
                        <div style="padding-left: 20px">
                            <button type="submit" onclick="initPage(${page.current})" class="btn blue btn-outline btn-lg"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="entry">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <table class="table echo" style="table-layout:fixed">
                            <thead>
                            <tr style="white-space:nowrap">
                                <th> 头像 </th>
                                <th> 用户名 </th>
                                <th> 邮箱 </th>
                                <th> 电话 </th>
                                <th> 角色 </th>
                                <th> 状态 </th>
                                <th> 最后更新时间 </th>
                                <th> 操作 </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="user">
                                <tr style="white-space:nowrap">
                                    <td><img width="20%" height="5%" src="${user.pic}" alt="no"></td>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.id == 1 ? "超级管理员" : (user.role ? "管理员" : "普通用户")}</td>
                                    <td>${user.status == 1 ? "有效" : "已删除"}</td>
                                    <td><fmt:formatDate value="${user.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <a type="button" href="/back/admin/user/info?id=${user.id}"
                                           class="btn blue btn-outline"><i class="fa fa-edit">编辑</i></a>
                                        <button class="btn btn-outline ${user.id == 1 || user.id == sessionScope.user.id ? 'grey' : 'red '} ${user.status == 1 ? '' : 'hidden'}" data-toggle="modal" data-target="#modifyUserConfirm"
                                                onclick="setDeleteModalValue('${user.id}','${user.username}')" ${user.id == 1 || user.id == sessionScope.user.id ? 'disabled' : ''}>
                                            <i class="fa fa-trash">删除</i></button>
                                        <button class="btn green btn-outline ${user.status == 1 ? 'hidden' : ''}"
                                                data-toggle="modal" data-target="#activeConfirm" onclick="setActiveModalValue('${user.id}','${user.username}')">
                                            <i class="fa fa-unlock">激活</i></button>
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

    <%@include file="../../../includes/back/metronij.jsp" %>

<div class="modal fade" id="modifyUserConfirm" tabindex="-1" role="basic" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><b>需要输入管理员账户与密码确认删除</b></h4>
            </div>
            <div class="modal-body">
                <div class="form-body">
                    <div class="form-group form-md-line-input">
                        <b>被删除的用户为：<span id="delete_username" style="color: purple"></span></b>
                        <input type="text" id="delete_userId" name="id" class="form-control required hidden">
                    </div>
                    <div class="form-group form-md-line-input">
                        <input type="text" id="admin_username" name="username" class="form-control required"
                               placeholder="管理员账号" autocomplete="off">
                    </div>
                    <div class="form-group form-md-line-input">
                        <input type="password" id="admin_password" name="password" class="form-control required"
                               placeholder="管理员密码">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn dark btn-outline" data-dismiss="modal">取消</button>
                <button type="button" class="btn red" onclick="submitDeleteUser()">删除</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade bs-modal-sm" id="activeConfirm" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <input type="text" id="active_userId" name="id" class="required hidden">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">确认激活？</h4>
            </div>
            <div class="modal-body"> 是否确认激活用户 <span id="active_username"> </span></div>
            <div class="modal-footer">
                <button type="button" class="btn dark btn-outline" data-dismiss="modal">取消</button>
                <button type="button" class="btn green" onclick="submitActiveUser()">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script>
    var $deleteUserId = $("#delete_userId");
    var $deleteUsername = $("#delete_username");
    var $adminUsername = $("#admin_username");
    var $adminPassword = $("#admin_password");

    var $activeUserName = $("#active_username");
    var $activeUserId = $("#active_userId");

    function setDeleteModalValue(userId,username) {
        $deleteUserId.val(userId);
        $deleteUsername.html(username);
    }

    $("#modifyUserConfirm").on("hidden.bs.modal",function () {
        $deleteUserId.val('');
        $deleteUsername.html('');
        $adminUsername.val('');
        $adminPassword.val('');
        $adminUsername.css("border-bottom-color","");
        $adminPassword.css("border-bottom-color","");
    });

    function submitDeleteUser() {
        var id = $deleteUserId.val();
        var username = $adminUsername.val();
        var password = $adminPassword.val();
        var errorMessage = '';
        if (id == null || id == ''){
            errorMessage = '操作异常，被删掉用户id为空，请重新操作</br>';
        }

        if (username == null || username == ''){
            errorMessage = errorMessage + '管理员账号不能为空</br>';
            $adminUsername.css("border-bottom-color","red");
        }
        else {
            $adminUsername.css("border-bottom-color","green");
        }
        if (password == null || password == ''){
            errorMessage =  errorMessage + '管理员密码不能为空</br>';
            $adminPassword.css("border-bottom-color","red");
        }
        else {
            $adminPassword.css("border-bottom-color","green");
        }

        if (errorMessage.trim().length == 0){
            jQuery.ajax({
                url:"/back/admin/user/delete",
                type:"post",
                data:{
                    "id":id,
                    "adminUsername":username,
                    "adminPassword":password
                },
                success:function (data) {
                    if (data.status == 200){
                        toastr.success("删除成功");
                        window.setTimeout(function () {
                            window.location.href = "/back/admin/user/list";
                        }, 1000);
                    }
                    else {
                        toastr.error(data.message);
                    }
                },
                error:function (data) {
                    toastr.error("原因代码为 " + data.status,"删除失败：");
                }
            })
        }
        else {
            toastr.error(errorMessage,"操作失败：");
        }
    }

    function setActiveModalValue(userId,username) {
        $activeUserId.val(userId);
        $activeUserName.html(username);
    }
    $("#activeConfirm").on("hidden.bs.modal",function () {
        $activeUserId.val('');
        $activeUserName.html('');
    });
    function submitActiveUser() {
        var activeId = $activeUserId.val();
        $("#activeConfirm").modal("hide");
        jQuery.ajax({
            url:"/back/admin/user/active",
            type:"post",
            data:{
                "id":activeId,
                "status":1
            },
            success:function (data) {
                if (data.status == 200){
                    toastr.success("激活成功");
                    window.setTimeout(function () {
                        window.location.href = "/back/admin/user/list";
                    }, 1000);
                }
                else {
                    toastr.error(data.message);
                    $("#activeConfirm").modal("hide");
                }
            },
            error:function (data) {
                toastr.error("原因代码为 " + data.status,"激活失败：");
                $("#activeConfirm").modal("hide");
            }
        })
    }
</script>
<script>
    function initPage(current) {
        if (typeof(current) == "undefined") {
            $("#current").val(1)
        }
        $("#pageSize").val(10);
    }

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
