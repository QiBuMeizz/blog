package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台用户管理
 */
@Controller
@RequestMapping(value = "back")
public class UserController extends BaseController<User, UserService> {

    @Autowired
    private UserService userService;

    @GetMapping(value = "info")
    public String info(User user){
        userService.getUser(user);
        return "back/info";
    }

    @PostMapping(value = "save")
    public String save(){
        return "redirect:back/info";
    }
}
