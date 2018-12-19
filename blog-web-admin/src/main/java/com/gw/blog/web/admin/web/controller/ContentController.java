package com.gw.blog.web.admin.web.controller;

/**
 *后台内容管理
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "back")
public class ContentController {

    @GetMapping(value = "content/form")
    public String form(){
        return "back/content/form";
    }
}
