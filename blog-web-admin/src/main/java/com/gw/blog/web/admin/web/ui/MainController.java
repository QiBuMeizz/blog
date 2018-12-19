package com.gw.blog.web.admin.web.ui;

import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.ContentService;
import com.gw.blog.web.admin.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 前端展示首页
 */
@Controller
public class MainController  {

    @Autowired
    private TypeService typeService;

    @Autowired
    private ContentService contentService;

    @GetMapping(value = {"","main"})
    public String main(Content content, Page page, Model model){
        //分页列表
        content.setPage(page);
        //显示主页面

        BaseResult baseResult = contentService.pageList(content);
        model.addAttribute("pageResult",baseResult);

        //获得分类导航栏
        List<Type> typeList = typeService.selectAll();
        model.addAttribute("baseResult", BaseResult.success("",typeList));
        return "main";
    }

    /**
     * 根据typeId获取内容集合
     * @param content
     * @param model
     * @return
     */
    @GetMapping(value = "type/content")
    public String getContentByTypeId(Content content, Page page, Model model){

        Long typeId = content.getTypeId();
        BaseResult baseResult = contentService.pageList(content);
        model.addAttribute("pageResult",baseResult);

        //获得分类导航栏
        List<Type> typeList = typeService.selectAll();
        model.addAttribute("baseResult", BaseResult.success("",typeList));
        return "includes/ui/header";
    }
    /**
     * 分页显示内容
     * @return
     */
    @ResponseBody
    @PostMapping(value = "content")
    public String content(){
        return "content";
    }
}
