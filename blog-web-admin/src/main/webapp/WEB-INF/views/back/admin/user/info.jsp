<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="../../../includes/back/header.jsp"%>
    <title>我的信息</title>
    <style type="text/css">
        form *{
            font-size: 16px !important;
        }
    </style>
</head>
<body class="standard simple bodyBack">

<%@include file="../../../includes/back/background.jsp"%>

<div id="page" class="background">
    <div id="middle" style="width: 85% ;height: auto"  >
        <div id="home">
            <h2 class="home" style="color:lightgrey">用户信息</h2>
        </div>
        <div class="middle_content" >
            <h3 style="color: floralwhite">${updateUser.id == null ? '新增用户' : '修改用户信息'}</h3>

            <br> <br> <br>
            <div class="portlet-body form"  >
                <form role="form" action="/back/admin/user/save" method="post" modelAttribute="user" id="inputForm">
                    <div class="form-body">
                        <input type="text" name="id" value="${updateUser.id}" hidden>
                        <div class="form-group form-md-line-input">
                            <input type="text" name="username" class="form-control required" id="username"
                                   placeholder="请输入用户名" value="${updateUser.username}">
                            <label for="username">用户名</label>
                        </div>
                        <br>
                        <div class="form-group form-md-line-input">
                            <input type="password" name="password" class="form-control ${updateUser.id == null ? 'required' : ''}" id="password"
                                   placeholder="请输入密码${updateUser.id == null ? '' : '，如不修改密码可不填'}">
                            <label for="password">密码</label>
                        </div>
                        <br>
                        <div class="form-group form-md-line-input">
                            <input type="text" name="email" class="form-control email" id="email" placeholder="请输入邮箱"
                                   value="${updateUser.email}">
                            <label for="email">邮箱</label>
                        </div>
                        <br>
                        <div class="form-group form-md-line-input">
                            <input type="text" name="phone" class="form-control mobile" id="phone" placeholder="请输入手机号"
                                   value="${updateUser.phone}">
                            <label for="phone">手机号</label>
                        </div>
                        <br>
                        <div class="form-group form-md-line-input">
                            <select name="role" class="form-control" id="role" ${sessionScope.user.id != null && sessionScope.user.id == 1 && updateUser.id != 1 ? '' : 'disabled'}>
                                <option value="0">普通用户</option>
                                <option ${updateUser.role ? 'selected' : ''} value="1">${updateUser.id == 1 ? "超级" : ""}管理员</option>
                            </select>
                            <label for="role">角色</label>
                        </div>
                        <br>
                        <div class="form-group form-md-line-input ${updateUser.id == null ? 'hidden':''}">
                            <input type="text" class="form-control"
                                   value="<fmt:formatDate value="${updateUser.updated}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                   readonly>
                            <label>更新时间</label>
                        </div>
                    </div>
                    <br>

                    <div style="padding-left: 20px">
                        <button type="submit" class="btn blue btn-outline"><i class="fa fa-check">提交</i></button>
                        <button type="button" class="btn default btn-outline" onclick="history.go(-1);"><i class="fa fa-mail-reply">返回</i></button>
                    </div>

                </form>
            </div>


        </div>

    </div>
</div>
<%@include file="../../../includes/back/metronij.jsp"%>

<script type="text/javascript">
    $(function () {
        // console.log()
    })
</script>

</body>
</html>
