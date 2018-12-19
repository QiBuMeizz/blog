package com.gw.blog.web.admin.web.interceptor;

import com.gw.blog.commons.contants.Contents;
import com.gw.blog.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆拦截器
 *
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute(Contents.SESSION_USER);

        // 用户未登录
        if (user == null) {
            // 重定向到登录页
            response.sendRedirect("/back/login");
            return false;
        }

        // 用户已登录
        return true;
    }
}
