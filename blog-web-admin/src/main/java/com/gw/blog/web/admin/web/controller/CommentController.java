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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    // 删除评论
    @GetMapping(value = "delete")
    public String delete(String id, RedirectAttributes redirectAttributes){
        Comment comment = new Comment();
        comment.setId(Long.parseLong(id));
        BaseResult delete = service.delete(comment);
        redirectAttributes.addFlashAttribute(Contents.SESSION_USER,delete);
        return "redirect:/back/comment/list" ;
    }

    //审核评论
    @PostMapping(value = "save")
    public  String save(String id,String status,RedirectAttributes redirectAttributes){
        Comment comment = new Comment();
        comment.setStatus(Integer.parseInt(status));
        comment.setId(Long.parseLong(id));
        BaseResult save = service.save(comment);
        redirectAttributes.addFlashAttribute(Contents.SESSION_USER,save);
        return "redirect:/back/comment/list" ;
    }
}
