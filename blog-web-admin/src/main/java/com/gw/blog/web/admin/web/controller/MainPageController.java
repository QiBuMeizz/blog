package com.gw.blog.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//后台主页

@Controller
@RequestMapping(value = "back")
public class MainPageController {

    @GetMapping(value = "main")
    public String main(){
        return "back/main";
    }
}
