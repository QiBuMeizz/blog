package com.gw.blog.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台评论管理
 */
@Controller
@RequestMapping(value = "back")
public class CommentController {

    @GetMapping(value = "comment/form")
    public String form(){
        return "back/comment/form";
    }
}
