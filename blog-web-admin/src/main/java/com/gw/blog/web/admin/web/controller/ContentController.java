package com.gw.blog.web.admin.web.controller;

/**
 *后台内容管理
 */

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "back")
public class ContentController extends BaseController<Content,ContentService> {

    @GetMapping(value = "content/list")
    public String list(Content content, Page page, Model model){
        //分页列表
        content.setPage(page);

        //显示主页面
        BaseResult baseResult = service.pageList(content);
        model.addAttribute("pageResult",baseResult);
        return "back/content/list";
    }
}
