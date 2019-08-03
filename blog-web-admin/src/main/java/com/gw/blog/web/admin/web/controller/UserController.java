package com.gw.blog.web.admin.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;


/**
 * 后台用户管理
 */
@Controller
@RequestMapping(value = "back")
public class UserController extends BaseController<User, UserService> {
    private static final Logger LOG = Logger.getLogger(UserController.class);
    //个人信息展示
    @GetMapping(value = "info")
    public String info(){
        return "back/info";
    }

    //更新个人信息
    @PostMapping(value = "save")
    public String save(User user, RedirectAttributes redirectAttributes, HttpServletRequest request){
        User sessionUser = (User) request.getSession().getAttribute(Contents.SESSION_USER);
        LOG.info(sessionUser.getUsername() + " 用户操作 save() 更新用户信息，参数为 ===>> " + JSONObject.toJSONString(user));
        BaseResult result;
        //判断更新的信息是否当前登录用户
        boolean isLoginUser = user != null && sessionUser.getUsername().equals(user.getUsername());

        //管理员
        if (sessionUser.getRole()) {
            result = service.save(user);
        }
        //非管理员
        else {
            //不为管理员 当前登录用户不能更改用户名
            if (isLoginUser) {
                //只有管理员才能更改角色
                user.setRole(sessionUser.getRole());
                result = service.save(user);
            }
            else {
                result = BaseResult.fail("无权限更改用户名");
            }
        }

        result.setData(user);
        if (BaseResult.STATUS_SUCCESS  == result.getStatus()) {
            if (isLoginUser) {
                //如果更新的是当前登录用户信息则需要同步更新session
                BeanUtils.copyProperties(user, sessionUser);
                request.getSession().setAttribute(Contents.SESSION_USER, sessionUser);
            }
            redirectAttributes.addFlashAttribute(Contents.BASE_RESULT, result);
        }
        else {
            redirectAttributes.addFlashAttribute(Contents.BASE_RESULT, result);
        }
        LOG.info("save() 出口数据 ===>> " + JSONObject.toJSONString(result));
        return "redirect:/back/info";
    }


}


