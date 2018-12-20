<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <title>内容管理</title>
    <%@include file="../../includes/back/metronic.jsp"%>
    <link href="https://cdn.bootcss.com/zTree.v3/3.5.33/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>
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
                            </div>

                            <div class="form-group form-md-line-input">
                                <input type="text" name="typeId" class="form-control" id="typeId" placeholder="请输入文章类型"
                                       value="${content.typeId}" readonly style="cursor: pointer" data-toggle="modal"
                                       href="#zModel">
                                <label for="typeId">文章类型</label>

                            </div>
                        </div>

                        <div style="padding-left: 20px">
                            <button type="submit" class="btn blue btn-outline">提交</button>
                            <button type="button" class="btn default btn-outline">取消</button>

                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <%@include file="../../includes/back/metronij.jsp" %>

    <script src="https://cdn.bootcss.com/zTree.v3/3.5.33/js/jquery.ztree.core.js" type="text/javascript"></script>

    <div class="modal fade" id="zModel" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">选择父类别</h4>
                </div>
                <div class="modal-body">
                    123
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn green" data-dismiss="modal">保存</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<script type="text/javascript">
    var zTreeObj;
    // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
    var setting = {
        

    };
    // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
    var zNodes = [
        {name:"test1", open:true, children:[
                {name:"test1_1"}, {name:"test1_2"}]},
        {name:"test2", open:true, children:[
                {name:"test2_1"}, {name:"test2_2"}]}
    ];
    $(document).ready(function(){
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });
</script>
<%--<script src="/static/assets/metronic/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/pages/scripts/ui-modals.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/layouts/layout4/scripts/layout.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/layouts/layout4/scripts/demo.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="/static/assets/metronic/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>--%>
</body>
</html>
