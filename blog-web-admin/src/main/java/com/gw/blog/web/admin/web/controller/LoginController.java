package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.utils.CookieUtils;
import com.gw.blog.domain.Content;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆管理
 */
@Controller
@RequestMapping(value = "back")
public class LoginController extends BaseController<User, UserService> {

    /**
     * 跳转到登录页面
     * @param request
     * @return
     */
    @GetMapping(value = "login")
    public String login(HttpServletRequest request, Model model){
        String cookieValue = CookieUtils.getCookieValue(request, Contents.COOKIE_USER);

        // 判断是否已记住密码, 是则回显
        if (StringUtils.isNotBlank(cookieValue)) {
            String[] cookieValues = cookieValue.split(":");
            User user = new User();
            user.setUsername(cookieValues[0]);
            user.setPassword(cookieValues[1]);
            model.addAttribute(Contents.COOKIE_USER, user);
        }

        return "back/login";
    }

    /**
     * 登录
     * @param params
     * @param redirectAttributes
     * @return
     */
    @PostMapping(value = "login")
    public String login(User params, String remember, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes){
        User user = service.login(params);

        // 登录成功
        if (user != null) {

            // 记住密码
            if ("on".equals(remember)) {
                // 保存账号密码到 cookie , 时间为 24 小时
                CookieUtils.setCookie(request, response, Contents.COOKIE_USER,
                        String.format("%s:%s",user.getUsername(),user.getPassword()), 60*60*24);
            }

            else {
                // 清除旧 cookie
                if (StringUtils.isNotBlank(CookieUtils.getCookieValue(request, Contents.COOKIE_USER))) {
                    CookieUtils.deleteCookie(request, response, Contents.COOKIE_USER);
                }
            }

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

    @GetMapping(value = "logout")
    public String Logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/back/login";
    }
}
