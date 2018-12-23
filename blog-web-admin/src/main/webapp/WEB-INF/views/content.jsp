<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/17
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sys" uri="/WEB-INF/views/tag/sys.tld" %>
<!DOCTYPE html>
<!-- saved from url=(0052)http://v.bootstrapmb.com/2018/7/fsjud1659/index.html -->
<html class="" lang="en">
<!--<![endif]-->
<head>
    <jsp:include page="includes/ui/head.jsp"/>
    <title>GW-Blog</title>
    <style>
        .hide-reply-btn{
            position: fixed;
            top: auto;
            bottom: 0;
            left: 50%;
            text-align: center !important;
            border: 1px solid #BFBFBF !important;
            z-index: 9999;
            width: 20%;
            height: 5%;
        }
        .modal-backdrop {
            z-index: 0 !important;
        }
    </style>
</head>
<body>

<!-- PAGE WRAP -->
<div id="page-wrap">
    <!-- HEADER -->
    <jsp:include page="includes/ui/header.jsp"/>
    <!-- END / HEADER -->

    <%--博客内容--%>
    <!-- BLOG MAIN CONTENT -->
    <section class="blog-content blog-standard">
        <div class="container">
            <div class="row">
                <%--左边栏--%>

                <!-- CONTENT -->
                <div class="col-md-9" id="tab_1">
                    <div class="content" style="margin-right: 100px;">

                        <div class="post">
                            <div class="post-media">
                                <div class="image-wrap">
                                    <img src="/static/assets/ui/home/welcome2.png" alt="">
                                </div>
                                <div class="post-cat">
                                    <a href="#">${content.title}</a>
                                </div>
                            </div>
                            <div class="post-meta">
                                <div class="post-format">
                                    <a href="#"><i class="fa fa-image"></i></a>
                                </div>
                                <div class="post-date">
                                    <span class="year"><fmt:formatDate value="${content.updated}" pattern="yyyy"/> </span>
                                    <span class="month"><fmt:formatDate value="${content.updated}" pattern="MM"/></span>
                                    <span class="day"><fmt:formatDate value="${content.updated}" pattern="dd"/></span>
                                </div>
                                <div class="post-comment">
                                    <i class="fa fa-comment"></i>
                                    <a href="#">${content.reads}</a>
                                </div>
                            </div>
                            <div class="post-body">
                                <div class="post-title">
                                    <h1>${content.title}</h1></div>
                                <div class="post-entry">
                                    ${content.content}
                                </div>
                                <div class="post-share">
										<span class="share-toggle pi-btn">
											<i class="fa fa-share-alt"></i>
										</span>
                                    <div class="share">
                                        <a href="#"><i class="fa fa-wechat"></i></a>
                                        <a href="#"><i class="fa fa-qq"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div id="tab_2"></div>
                        </div>
                        <!-- END / POST -->

                        <!-- COMMENTS -->
                        <div id="comments">
                            <div class="comments-inner-wrap">
                                <h3 id="comments-title" class="h5 text-uppercase"></h3>
                                <ul id="comment-list" class="commentlist">

                                </ul>
                                <div id="showMoreParent" class="hover" style="position:absolute;left: 37%;display: none;"><a href="javascript:showMore()">查看更多...</a></div>
                            </div>
                        </div>
                        <!-- END / COMMENTS -->
                        <div id="tab_3"></div>
                        <!-- LEAVER YOUR COMMENT -->
                        <div id="respond">
                            <div class="reply-title">
                                <h3 class="h4 text-uppercase">留下你的评论</h3></div>
                            <!-- COMMENT FORM -->
                            <form id="comment-form" action="/comment/form" method="post">
                                <input type="hidden" name="contentId" value="${content.id}">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-item input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </span>
                                            <input name="name" type="text" class="form-control"
                                                   minlength="2" maxlength="20" required autocomplete="off"
                                                   placeholder="请输入你的名字" value="${commentResult.data.name}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <div class="form-item input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-envelope"></i>
                                            </span>
                                            <input id="comment-email" name="email" type="email" class="form-control"
                                                   autocomplete="off" placeholder="请输入你的邮箱" required value="${commentResult.data.email}">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-item form-textarea-wrapper">
                                            <textarea id="comment-text" name="text" class="form-control" required
                                                      autocomplete="off" placeholder="请输入内容">${commentResult.data.text}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4 pull-right">
                                        <div class="form-actions pull-right">
                                            <button type="submit" class="btn btn-default" title="提交"><i class="fa fa-send"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- END / COMMENT FORM -->
                        </div>
                    </div>
                </div>
                <!-- END / CONTENT -->

                <%--右边栏--%>
                <jsp:include page="includes/ui/right.jsp"/>
            </div>
        </div>
    </section>

    <!-- /.modal -->
    <div id="commentModal" class="modal fade" style="z-index: 10000;" tabindex="-1" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">回复</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- COMMENT FORM -->
                            <form id="respon-form" action="/comment/form" method="post">
                                <input type="hidden" name="contentId" value="${content.id}">
                                <input type="hidden" name="parentId">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-item input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </span>
                                            <input id="respon-name" name="name" type="text" class="form-control"
                                                   minlength="2" maxlength="20" required autocomplete="off"
                                                   placeholder="请输入你的名字"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <div class="form-item input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-envelope"></i>
                                            </span>
                                            <input id="respon-email" name="email" type="email" class="form-control"
                                                   autocomplete="off" placeholder="请输入你的邮箱" required>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-item form-textarea-wrapper">
                                            <textarea id="respon-text" name="text" class="form-control" required
                                                      autocomplete="off" placeholder="请输入内容"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="top:10px">
                                        <div class="form-actions pull-right">
                                            <button data-dismiss="modal" class="btn btn-default" title="关闭"><i class="fa fa-reply"></i></button>
                                            <button type="submit" class="btn btn-default" title="提交"><i class="fa fa-send"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- END / COMMENT FORM -->
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- FOOTER -->
    <jsp:include page="includes/ui/footer.jsp"/>
</div>
</body>

<script type="text/javascript">

    //这是跳转的逻辑
    function page(current) {
        //current跳转到哪一页  pageSize每页的条数
        $("#current").val(current);
        //window.location.href="/user/list?current="+current+"&pageSize="+pageSize;
        $("#searchForm").submit();
    }
    $(function () {
        if(${content.id == 1 || content.id == 2}){
            //敬请期待,关于我们没有评论 1为关于我们 2为敬请期待
            $("#comments").remove();
            $("#respond").remove();
        }
        else {
            //初始加载展示评论
            showComment("comment-list","showMoreParent");
        }
    })
    /* BEGIN SHOW COMMENT */
    //起始下标
    var index = 0;
    //展示数量
    var size = 3;
    //展示评论
    function showComment(ul_id,show_more_id,id,subIndex) {
        $.ajax({
            url:"/comment/show",
            type:"post",
            data:{"id":id,"contentId":${content.id == null ? '':content.id},"index":subIndex == null? index :subIndex,"size":size},
            success:function (data) {
                //判断是否还有更多数据
                if(data.isHashMore){
                    //展示 更多 按钮
                    $("#"+show_more_id).css('display','block');
                }
                else {
                    //隐藏 更多 按钮
                    $("#"+show_more_id).css('display','none');
                }
                var list = data.commentList;
                //没有评论
                if(id == null && list.length == 0){
                    $("#"+ul_id).append('<p>暂无评论，赶紧去发表你的评论吧！</p>')
                }
                //有评论
                else {
                    for(var i = 0; i < list.length; i++){
                        var comment = list[i];
                        //回复的对象
                        var parentName='';
                        //是否展示 查看回复 按钮
                        var isShowReplyBtn = "";

                        if(comment.parentId != 0){
                            //不是一级评论，隐藏 查看回复 按钮
                            isShowReplyBtn = "none";
                            parentName = "回复 &nbsp;@"+comment.parentName+"&nbsp;:";
                        }
                        else{
                            //是否拥有回复，没有则隐藏 查看回复 按钮
                            if(!comment.isParent){
                                isShowReplyBtn = "none";
                            }
                        }

                        $("#"+ul_id).append('<li class="comment" id="tab_comment_'+comment.id+'"> \n' +
                            '                   <div class="comment-box" style="word-wrap: break-word;word-break: break-all;overflow: hidden;">\n' +
                            '                       <div class="comment-author">\n' +
                            '                           <a href="#"><img src="/static/assets/ui/home/5(1).jpg" alt=""></a>\n' +
                            '                       </div>\n' +
                            '                       <div class="comment-body">\n' +
                            '                           <cite class="fn text-uppercase">\n' +
                            '                               <a href="http://v.bootstrapmb.com/2018/7/fsjud1659/single.html#">'+comment.name+'</a>\n' +
                            '                           </cite>\n' +
                            '                           <div class="comment-meta">\n' +
                            '                               <span>'+DateTime.format(comment.created,"yyyy-MM-dd HH:mm:ss")+'</span>\n' +
                            '                           </div><br/>\n' +
                            '                           <p>'+parentName+comment.text+'</p>\n' +
                            '                       </div>\n' +
                            '                       <div class="comment-abs">\n' +
                            '                           <a data-target="#commentModal" class="comment-reply-link pull-right" data-toggle="modal">回复</a><br/>\n' +
                            '                           <a style="display: '+isShowReplyBtn+'" href="javascript:showComment(\'children'+comment.id+'\',\'showMore'+comment.id+'\','+comment.id+',0)" id="showReplyBtn'+comment.id+'" class="pull-right" onclick="show('+comment.id+')">查看回复</a>\n' +
                            '                           <a style="display: none" id="hideReplyBtn'+comment.id+'" class="hide-reply-btn" onclick="hide('+comment.id+')">收起回复</a>\n' +
                            '                       </div>\n' +
                            '                   </div>\n' +
                            '                   <ul id="children'+comment.id+'" class="children">\n' +
                            '                   </ul>\n' +
                            '                   <div id="showMore'+comment.id+'" style="position:absolute;left: 20%;display: none;z-index: 100;" value="'+data.index+'"><a href="javascript:showMore('+comment.id+')" style="color: #1d75b3">更多回复...</a></div>\n' +
                            '               </li>')
                        //回复不需要子回复
                        if(comment.parentId != 0){
                            $("#children"+comment.id).remove();
                            $("#showMore"+comment.id).remove();
                        }
                    }
                }
            }
        })
    }

    function show(id) {
        var showBtnID = $("#showReplyBtn"+id);
        var hideBtnID = $("#hideReplyBtn"+id);

        //显示 收起回复 按钮
        hideBtnID.css("display","block");
        //隐藏 查看回复 按钮
        showBtnID.css("display","none");
    }
    function hide(id) {
        var hideBtnID = $("#hideReplyBtn"+id);
        var showBtnID = $("#showReplyBtn"+id);

        //隐藏 收起回复 按钮
        hideBtnID.css("display","none");
        //显示 查看回复 按钮
        showBtnID.css("display","block");
        //隐藏 更多回复 按钮
        $("#showMore"+id).css("display","none");
        //移除回复内容
        $("#children"+id+" .comment").remove();
        //查看回复按钮下标归零
        $("#showMore"+id).attr("value",0);
        location.href = "#tab_comment_"+id;
    }
    //展示更多
    function showMore(id) {
        //展示更多评论
        if(id == null){
            //更多评论起使下标+1
            index = index+1;
            showComment("comment-list","showMoreParent");
        }
        //展示更多回复
        else{
            var childrenID = "children"+id;
            var showMoreID = "showMore"+id;
            //获取更多回复起使下标
            var subIndex = parseInt($("#"+showMoreID).attr("value"));
            //更多回复起使下标+1
            $("#"+showMoreID).attr("value",subIndex+1);
            showComment(childrenID,showMoreID,id,subIndex+1);
        }
    }
    /* END SHOW COMMENT */

    var local = window.location;
    if (local == "http://localhost:8080/content?id=1"){
        $("#menu li:last").addClass("current-menu-parent");
    }
</script>

</html>