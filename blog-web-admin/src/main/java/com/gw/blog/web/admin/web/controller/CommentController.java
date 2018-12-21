package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.Comment;
import com.gw.blog.web.admin.service.CommentService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 后台评论管理
 */
@Controller
@RequestMapping(value = "back/comment")
public class CommentController extends BaseController<Comment, CommentService> {

    //评论通过审核的状态值
    private static final Integer PASS_COMMENT = 1;

    /**
     * 展示
     * @param comment
     * @param page
     * @param model
     * @return
     */
    @GetMapping(value = "list")
    public String list(Comment comment, Page page, Model model){

        //分页列表
        comment.setPage(page);

        //显示主页面
        BaseResult baseResult = service.pageList(comment);
        model.addAttribute("pageResult",baseResult);
        return "back/comment/list";
    }

    /**
     * 删除
     * @param model
     * @param comment
     * @return
     */
    @GetMapping(value = "delete")
    public String delete(Comment comment, RedirectAttributes model){
        System.out.println(comment);
        BaseResult delete = service.delete(comment);
        model.addFlashAttribute(Contents.BASE_RESULT,delete);
        return "redirect:/back/comment/list";
    }

    /**
     * 信息回显
     * @return
     */
    @GetMapping(value = "form")
    public String form(Comment comment, Model model){
        model.addAttribute("comment",comment);
        return "back/comment/form";
    }

    /**
     * 评论通过审核
     * @return
     */
    @RequestMapping(value = "save")
    public String save(Comment comment,RedirectAttributes redirectAttributes){
        comment.setStatus(PASS_COMMENT);
        BaseResult baseResult = service.save(comment);
        redirectAttributes.addFlashAttribute(Contents.BASE_RESULT,baseResult);
        return "redirect:/back/comment/list";
    }


}
