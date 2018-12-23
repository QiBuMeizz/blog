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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

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
    @RequestMapping(value = "list")
    public String list(Comment comment, Page page, Model model){

        //分页列表
        comment.setPage(page);

        //显示主页面
        BaseResult baseResult = service.pageList(comment);
        model.addAttribute("comment",comment);
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
        List<Long> newList = new ArrayList<>();
        //获得子评论集合
        getDeleteId(comment,newList);
        //转换成Long 数组
        Long[] ids = new Long[newList.size()];
        for (int i = 0; i < newList.size(); i++) {
            ids[i] = newList.get(i);
        }
        service.deleteMore(ids);
        List<Comment> list = service.selectByParentId(comment.getParentId());
        Comment parentComment = service.selectById(comment.getParentId());
        if (list == null || list.size() == 0) {
            parentComment.setIsParent(false);
        } else {
            parentComment.setIsParent(true);
        }
        service.save(parentComment);
        model.addFlashAttribute(Contents.BASE_RESULT,BaseResult.success("删除数据成功!!!"));
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
    /**
     * 多选删除
     * @param array
     * @return
     */
    @ResponseBody
    @PostMapping(value = "delete")
    public String delete(String array){
        if (array == null || "".equals(array)){
            return "error";
        }

        //分成数组
        String[] ids = array.split(",");
        Long[] longIds = new Long[ids.length];
        for (int i = 0; i < ids.length; i++) {
            longIds[i] = Long.parseLong(ids[i]);
        }

        service.deleteMore(longIds);
        return null;
    }


    private void getDeleteId(Comment comment, List<Long> list) {
        if (comment.getIsParent()){
            List<Comment> comments = service.selectByParentId(comment.getId());
            for (Comment child : comments) {
                getDeleteId(child,list);
            }
        }
        list.add(comment.getId());
    }
}
