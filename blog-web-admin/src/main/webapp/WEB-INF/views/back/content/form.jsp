<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <title>内容管理</title>
    <%--<link href="https://cdn.bootcss.com/zTree.v3/3.5.33/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>--%>
    <link href="https://cdn.bootcss.com/zTree.v3/3.5.33/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/back/wangEditor/wangEditor.min.css" rel="stylesheet" type="text/css"/>
</head>
<body class="standard simple">

<div class="bgImage">
    <img src="/static/assets/back/images/subpage_bg.jpg" alt="" />
</div>
<!-- _________________________ Finish Background Image __________________________ -->
<div id="page" class="background">
    <%@include file="../../includes/back/background.jsp" %>

    <div id="middle">
        <div id="home">
            <h2 class="home" style="color:lightgrey">内容管理</h2>
        </div>
        <div class="middle_content">
            <h3 style="color: floralwhite">${content.id!=null?"修改":"添加"}内容</h3>
            <div class="entry">
                <div class="portlet-body form">
                    <form role="form" action="/back/content/save" method="post" modelAttribute="content">
                        <div class="form-body">
                            <input type="text" name="id" value="${content.id}" hidden>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="typeId" id="typeId" value="${content.typeId}">
                                <input type="text" name="typeName" class="form-control" id="typeName" placeholder="请输入文章类型"
                                       value="${content.typeName}" readonly style="cursor: pointer" data-toggle="modal"
                                       href="#zModel">
                                <label for="typeId">文章类型</label>
                            </div>
                            <div class="form-group form-md-line-input">
                                <input type="text" name="title" class="form-control" id="title" placeholder="请输入文章标题"
                                       value="${content.title}">
                                <label for="title">文章标题</label>
                            </div>

                            <div class="form-group form-md-line-input">
                                <input type="text" name="titleDesc" class="form-control" id="titleDesc"
                                       placeholder="请输入简介" value="${content.titleDesc}">
                                <label for="titleDesc">简介</label>
                            </div>

                            <div style="display: ${content.id==null?'none':''}">
                                <div class="form-group form-md-line-input">
                                    <input type="text" name="user.username" class="form-control" id="user"
                                           placeholder="请输入作者" value="${content.user.username}" readonly>
                                    <label for="user">作者</label>
                                </div>

                                <div class="form-group form-md-line-input">
                                    <input type="text" name="reads" class="form-control" id="reads" placeholder="请输入阅读量"
                                           value="${content.reads}" readonly>
                                    <label for="reads">阅读量</label>
                                </div>

                                <div class="form-group form-md-line-input">
                                    <input type="text" name="content" class="form-control" id="content"
                                           value="${content.content}" hidden>
                                </div>

                                <div id="editor" class="form-group form-md-line-input">
                                </div>
                            </div>

                           
                        </div>

                        <div style="padding-left: 20px">
                            <button type="submit" class="btn blue btn-outline" id="submit">提交</button>
                            <button type="button" class="btn default btn-outline">取消</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <%@include file="../../includes/back/metronij.jsp" %>

    <script src="https://cdn.bootcss.com/zTree.v3/3.5.33/js/jquery.ztree.core.js" type="text/javascript"></script>
    <script src="/static/assets/back/wangEditor/wangEditor.js" type="text/javascript"></script>

</div>
    
<script>
    var zTreeObj;
    // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
    var setting = {
        async:{
            enable: true,
            url: "/back/content/async",
            autoParam: ["id"]
        },
        data:{
            simpleData:{
                enable:true,
                idKey: "id",
                pIdKey: "parentId",
                rootPId: 0
            }
        },
        callback: {
            onClick: onClick
        }
    };
    function onClick(event, treeId, treeNode) {
        console.log(treeNode.name);
        console.log(treeNode.id);
        $("#typeName").val(treeNode.name);
        $("#typeId").val(treeNode.id);
    };
    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting);

    });

    var E = window.wangEditor
    var editor = new E('#editor')
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create();
    document.getElementById('submit').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html());
        $("#content").val(editor.txt.html());
    }, false);

</script>

</body>
</html>
