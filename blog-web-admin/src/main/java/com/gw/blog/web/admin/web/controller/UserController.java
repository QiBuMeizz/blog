package com.gw.blog.web.admin.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.gw.blog.commons.abstracts.BaseController;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
    @PostMapping(value = {"save","admin/user/save"})
    public String save(User user, RedirectAttributes redirectAttributes, HttpServletRequest request, Model model){
        User sessionUser = (User) request.getSession().getAttribute(Contents.SESSION_USER);
        LOG.info(sessionUser.getUsername() + " 用户操作 save() 更新用户信息，参数为 ===>> " + JSONObject.toJSONString(user));
        BaseResult result;
        Boolean updateUserRole = user.getRole();
        //判断更新的信息是否当前登录用户
        boolean isLoginUser = sessionUser.getId().equals(user.getId());

        if (!Contents.SUPER_ADMIN_USER_ID.equals(sessionUser.getId()) || Contents.SUPER_ADMIN_USER_ID.equals(user.getId())) {
            //只有超级管理员才能更改角色,但是超级管理员不能更改自己的角色
            user.setRole(null);
        }

        //管理员
        if (sessionUser.getRole()) {
            if (Contents.SUPER_ADMIN_USER_ID.equals(user.getId()) && !Contents.SUPER_ADMIN_USER_ID.equals(sessionUser.getId())){
                //更改超级管理员的信息，当前登录用户并非管理员则不能操作
                result = BaseResult.fail("无权限进行此操作");
            }else {
                result = service.save(user);
            }
        }
        //非管理员
        else {
            //不为管理员 当前登录用户不能更改用户名
            if (isLoginUser) {
                result = service.save(user);
            }
            else {
                result = BaseResult.fail("无权限更改用户名");
            }
        }

        user.setRole(updateUserRole);
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
        String requestUrl = request.getRequestURL().toString();
        LOG.info("save() 入口路径为" + requestUrl);
        LOG.info("save() 出口数据 ===>> " + JSONObject.toJSONString(result));
        if (requestUrl.endsWith("/back/save")){
            return "redirect:/back/info";
        }
        else {
            if (BaseResult.STATUS_SUCCESS == result.getStatus()){
                return "redirect:/back/admin/user/list";
            }
            model.addAttribute(Contents.BASE_RESULT, result);
            return adminInfo(user,model);
        }
    }

    @RequestMapping(value = "/admin/user/list")
    public String list(User user, Page page, Model model){
        LOG.info("UserController 接口 list() 入口参数为 ===>> user=" + JSONObject.toJSONString(user) + ",page=" + JSONObject.toJSONString(page));
        //分页列表
        user.setPage(page);
        //显示主页面
        BaseResult baseResult = service.pageList(user);
        model.addAttribute("user",user);
        model.addAttribute("pageResult",baseResult);
        return "back/admin/user/list";
    }

    /**
     * 逻辑删除 用户
     * @param user
     * @param adminUsername
     * @param adminPassword
     * @return
     */
    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
    @ResponseBody
    public BaseResult delete(User user, String adminUsername, String adminPassword, HttpServletRequest request) {
        User sessionUser = (User) request.getSession().getAttribute(Contents.SESSION_USER);
        if (sessionUser.getId().equals(user.getId())){
            return BaseResult.fail("非法操作！！！");
        }
        user.setUsername(adminUsername);
        user.setPassword(adminPassword);
        BaseResult deleteResult = service.delete(user);
        return deleteResult;
    }

    @GetMapping(value = "/admin/user/info")
    public String adminInfo(User user, Model model){
        model.addAttribute(Contents.UPDATE_USER_KEY,user);
        return "back/admin/user/info";
    }

    @PostMapping("/admin/user/active")
    @ResponseBody
    public BaseResult active(User user){
        user.setPassword(null);
        BaseResult result = service.save(user);
        return result;
    }
}


