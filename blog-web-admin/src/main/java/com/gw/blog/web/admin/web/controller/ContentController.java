package com.gw.blog.web.admin.web.controller;

/**
 *后台内容管理
 */

import com.gw.blog.web.admin.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "back")
public class ContentController {
    @Autowired
    private ContentService contentService;

    @GetMapping(value = "content/form")
    public String form(){
        return "back/content/form";
    }
}
