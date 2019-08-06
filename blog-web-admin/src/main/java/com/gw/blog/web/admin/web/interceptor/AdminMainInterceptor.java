package com.gw.blog.web.admin.web.interceptor;

import com.gw.blog.commons.contants.Contents;
import com.gw.blog.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMainInterceptor implements HandlerInterceptor {
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        User loginUser = (User) request.getSession().getAttribute(Contents.SESSION_USER);
        // 用户已登录但不是管理员
        if (loginUser != null && !loginUser.getRole()) {
            response.sendRedirect("/back/main");
        }
    }
}
