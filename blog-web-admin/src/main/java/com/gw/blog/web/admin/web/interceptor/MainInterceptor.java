package com.gw.blog.web.admin.web.interceptor;


import com.gw.blog.commons.contants.Contents;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆后的拦截器
 */
public class MainInterceptor implements HandlerInterceptor {
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 用户已登录
        if (request.getSession().getAttribute(Contents.SESSION_USER) != null) {
            // 如果请求来自登录页
            if (modelAndView!=null && modelAndView.getViewName().endsWith("login") && modelAndView != null) {
                // 重定向到后台首页
                response.sendRedirect("/back/main");
            }
        }
    }
}
