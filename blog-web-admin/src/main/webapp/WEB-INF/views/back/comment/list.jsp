<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../includes/back/header.jsp"%>
    <title>我的信息</title>
    <%@include file="../../includes/back/metronic.jsp"%>
</head>
<body class="standard simple">
<!-- _________________________ Start Background Image __________________________ -->
<%@include file="../../includes/back/background.jsp"%>
<!-- _________________________ Finish Background Image __________________________ -->

<!-- _________________________ Start Page ___________________________ -->
<div id="middle" style="width: 85%">
    <div id="home">
        <h2 class="home" style="color:lightgrey">评论管理</h2>
    </div>
    <div class="middle_content">
        <h3 style="color: floralwhite">评论列表</h3>
        <div class="entry">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="portlet light portlet-fit portlet-datatable bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class=" icon-layers font-green"></i>
                                <span class="caption-subject font-green sbold uppercase">评论列表</span>
                            </div>
                            <div class="actions">
                                <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                    <i class="icon-cloud-upload"></i>
                                </a>
                                <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                    <i class="icon-wrench"></i>
                                </a>
                                <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                    <i class="icon-trash"></i>
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_2">
                                <thead>
                                <tr>
                                    <th class="table-checkbox">
                                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                            <input type="checkbox" class="group-checkable" data-set="#sample_2 .checkboxes" />
                                            <span></span>
                                        </label>
                                    </th>
                                    <th> Username </th>
                                    <th> Email </th>
                                    <th> Status </th>
                                </tr>
                                </thead>
                                <tbody>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<!-- _________________________ Start Footer _________________________ -->
<%--<div id="footer">
    <p>Pacifico &copy; 2016 by 萌站</p>
</div>--%>
<!-- _________________________ Finish Footer ________________________ -->
<%@include file="../../includes/back/metronij.jsp"%>
</body>
</html>
