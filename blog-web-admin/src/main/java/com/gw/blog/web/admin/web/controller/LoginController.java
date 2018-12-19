package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 登陆管理
 */
@Controller
@RequestMapping(value = "back")
public class LoginController extends BaseController<User, UserService> {

    /**
     * 跳转到登录页面
     * @return
     */
    @GetMapping(value = "login")
    public String login(){
        return "back/login";
    }

    /**
     * 登录
     * @param params
     * @param redirectAttributes
     * @return
     */
    @PostMapping(value = "login")
    public String login(User params,String remember, HttpServletRequest request, RedirectAttributes redirectAttributes){
        User user = service.login(params);

        // 登录成功
        if (user != null) {

            // 保存在 session 并跳转到后台首页
            request.getSession().setAttribute(Contents.SESSION_USER, user);
            return "redirect:/back/main";
        }

        // 登录失败
        else {
            redirectAttributes.addFlashAttribute(Contents.SYSTEM_MESSAGE, "用户名或密码错误");
            return "redirect:/back/login";
        }
    }

}
