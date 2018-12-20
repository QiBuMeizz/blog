package com.gw.blog.web.admin.web.controller;

import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

import static com.gw.blog.commons.contants.Contents.SESSION_USER;

/**
 * 后台用户管理
 */
@Controller
@RequestMapping(value = "back")
public class UserController extends BaseController<User, UserService> {

    //个人信息展示
    @GetMapping(value = "info")
    public String info(){
        return "back/info";
    }

    //更新个人信息
    @PostMapping(value = "save")
    public String save(User user, RedirectAttributes redirectAttributes, HttpServletRequest request){
        BaseResult result = service.save(user);

        if (result.equals(BaseResult.success())) {
            User sessionUser = (User) request.getSession().getAttribute(SESSION_USER);
            request.getSession().setAttribute(SESSION_USER, sessionUser);
            BeanUtils.copyProperties(user, sessionUser);
            redirectAttributes.addFlashAttribute(Contents.SYSTEM_MESSAGE, "保存成功");
        redirectAttributes.addFlashAttribute(Contents.STATUS, BaseResult.STATUS_SUCCESS);
        }
        else {
            redirectAttributes.addFlashAttribute(Contents.SYSTEM_MESSAGE, result.getMessage());
            redirectAttributes.addFlashAttribute(Contents.STATUS, BaseResult.STATUS_FAIL);
        }
        return "redirect:/back/info";
    }


}


