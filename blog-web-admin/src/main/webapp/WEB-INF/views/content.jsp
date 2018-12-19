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
                <div class="col-md-9">
                    <div class="content" style="margin-right: 100px;">

                        <div class="post">
                            <div class="post-media">
                                <div class="image-wrap">
                                    <img src="/static/assets/ui/home/2(2).jpg" alt="">
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
                                    <i class="fa fa-book"></i>
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
                                        <a href="#">微信<i class="fa fa-wechat"></i></a>
                                        <a href="#">QQ<i class="fa fa-qq"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / POST -->
                        <!-- ABOUT AUTHOR -->
                        <div class="about-author" style="height: 170px">
                            <div class="image-thumb fl"><img src="/static/assets/ui/home/2(3).jpg" alt=""></div>
                            <div class="author-info">
                                <div class="author-name">
                                    <h4 class="text-uppercase">${content.user.username}</h4>
                                </div>
                                <div class="author-content">

                                </div>
                                <div class="author-social">
                                    <p>${content.user.email}</p>
                                </div>
                            </div>
                        </div>
                        <!-- END / ABOUT AUTHOR -->

                        <!-- COMMENTS -->
                        <div id="comments">
                            <div class="comments-inner-wrap">
                                <h3 id="comments-title" class="h5 text-uppercase">3 Comments</h3>
                                <ul class="commentlist">
                                    <li class="comment">
                                        <div class="comment-box">
                                            <div class="comment-author">
                                                <a href="#"><img src="/static/assets/ui/home/5(1).jpg" alt=""></a>
                                            </div>
                                            <div class="comment-body">
                                                <cite class="fn text-uppercase">
                                                    <a href="http://v.bootstrapmb.com/2018/7/fsjud1659/single.html#">评论者</a>
                                                </cite>
                                                <div class="comment-meta">
                                                    <span>July 12, 2014</span>
                                                </div>
                                                <p>评论内容</p>
                                            </div>
                                            <div class="comment-abs">
                                                <a href="#" class="comment-edit-link">Edit</a>//
                                                <a href="#" class="comment-reply-link">Reply</a>
                                            </div>
                                        </div>
                                        <ul class="children">
                                            <li class="comment">
                                                <div class="comment-box">
                                                    <div class="comment-author">
                                                        <a href="#"><img src="/static/assets/ui/home/9.jpg" alt=""></a>
                                                    </div>
                                                    <div class="comment-body">
                                                        <cite class="fn text-uppercase"><a href="#">评论者</a></cite>
                                                        <div class="comment-meta"><span>July 12, 2014</span></div>
                                                        <p>评论内容</p>
                                                    </div>
                                                    <div class="comment-abs">
                                                        <a href="#" class="comment-edit-link">Edit</a>//
                                                        <a href="#" class="comment-reply-link">Reply</a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="comment">
                                        <div class="comment-box">
                                            <div class="comment-author">
                                                <a href="#"><img src="/static/assets/ui/home/5(1).jpg" alt=""></a>
                                            </div>
                                            <div class="comment-body">
                                                <cite class="fn text-uppercase"><a href="#">评论者</a></cite>
                                                <div class="comment-meta">
                                                    <span>July 12, 2014</span>
                                                </div>
                                                <p>评论内容</p>
                                            </div>
                                            <div class="comment-abs">
                                                <a href="#" class="comment-edit-link">Edit</a>//
                                                <a href="#" class="comment-reply-link">Reply</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- END / COMMENTS -->
                        <!-- LEAVER YOUR COMMENT -->
                        <div id="respond">
                            <div class="reply-title">
                                <h3 class="h5 text-uppercase">留下你的评论</h3></div>
                            <!-- COMMENT FORM -->
                            <form>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-item form-name">
                                            <input type="text" placeholder="请输入你的名字">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-item form-email">
                                            <input type="text" placeholder="请输入你的邮箱">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-item form-textarea-wrapper">
                                            <textarea placeholder="请输入内容"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-actions">
                                            <input type="submit" value="评论" class="pi-btn">
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
</script>

</html>