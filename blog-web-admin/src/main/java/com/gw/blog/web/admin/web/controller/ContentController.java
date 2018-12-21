package com.gw.blog.web.admin.web.controller;

/**
 *后台内容管理
 */

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.abstracts.BaseTreeController;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.ContentService;
import com.gw.blog.web.admin.service.TypeService;
import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "back/content")
public class ContentController extends BaseController<Content,ContentService> {
    @Autowired
    private TypeService typeService;

    @RequestMapping(value = "list")
    public String list(Content content, Page page, Model model){
        //分页列表
        content.setPage(page);

        //显示主页面
        BaseResult baseResult = service.pageList(content);
        model.addAttribute("pageResult",baseResult);
        return "back/content/list";
    }

    /**
     * 跳转到编辑页面
     * @return
     */
    @GetMapping(value = "modify")
    public String modify(Content content,Model model) {
        //保存
        model.addAttribute("content",content);
        return "back/content/form";
    }

    /**
     * 点击添加或者修改内容
     * @return
     */
    @PostMapping(value = "save")
    public String save(Content content,Model model){
        //封装了修改成功消息
        BaseResult result = service.save(content);
        return "redirect:/back/content/list";
    }


    /**
     * 删除
     * @param content
     * @param redirectAttributes
     * @return
     */

    @GetMapping(value = "delete")
    public String delete(Content content, RedirectAttributes redirectAttributes){
        BaseResult result = service.delete(content);
        redirectAttributes.addFlashAttribute("message","删除数据成功!!!");
        return "redirect:/back/content/list";
    }

    /**
     * 批量删除
     */
    @ResponseBody
    @PostMapping(value = "delete")
    public String delete(String array){
        if (array == null || "".equals(array)){
            return "error";
        }
        //String[] split = array.split(",");

        BaseResult baseResult = service.deleteMore(array);
        return null;
    }

    /**
     * zTree获取已经排好序的类型列表
     * @return
     */
    @ResponseBody
    @PostMapping(value = "async")
    public List<Type> async(Long parentId){
        List<Type> sources = typeService.selectAll();
        List<Type> target = Lists.newArrayList();
        if(parentId!=null){
            sort(parentId,sources,target);
        }
        else {
            sort(0L,sources,target);
        }
        return target;
    }

    /**
     * 排序方法
     */
    private void sort(Long parentId,List<Type> sources,List<Type> target){
        for (Type type: sources) {
            if(parentId.equals(type.getParentId())){
                target.add(type);
            }
        }
    }

//    public  String

}
