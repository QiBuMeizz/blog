package com.gw.blog.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 文章类型管理
 */
@Controller
@RequestMapping(value = "back")
public class TypeController {

    @GetMapping(value = "type/form")
    public String form(){
        return "back/type/form";
    }

}
