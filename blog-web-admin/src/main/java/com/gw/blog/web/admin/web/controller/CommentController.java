package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.Comment;
import com.gw.blog.web.admin.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台评论管理
 */
@Controller
@RequestMapping(value = "back/comment")
public class CommentController extends BaseController<Comment, CommentService> {

    @GetMapping(value = "list")
    public String form(Comment comment, Page page, Model model){

        //分页列表
        comment.setPage(page);

        //显示主页面
        BaseResult baseResult = service.pageList(comment);
        model.addAttribute("CommentpageResult",baseResult);
        return "back/comment/list";
    }

    @GetMapping(value = "delete")
    public String delete(String id,Model model,Page page,Comment comment){

        Comment comment1 = service.selectById(Long.parseLong(id));

        BaseResult delete = service.delete(comment1);
        model.addAttribute(Contents.SESSION_USER,delete);
        return form(comment,page,model);
    }

}
