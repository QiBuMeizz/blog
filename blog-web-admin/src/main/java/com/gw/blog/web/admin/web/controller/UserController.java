package com.gw.blog.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台用户管理
 */
@Controller
@RequestMapping(value = "back")
public class UserController {

    @GetMapping(value = "main")
    public String main(){
        return "back/main";
    }

    @GetMapping(value = "info")
    public String info(){
        return "back/info";
    }
}
