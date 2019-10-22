package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BasePageServiceImpl;
import com.gw.blog.commons.abstracts.impl.BaseServiceImpl;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import com.gw.blog.commons.validation.BeanValidator;
import com.gw.blog.commons.validation.BeanValidatorGroup;
import com.gw.blog.domain.User;
import com.gw.blog.web.admin.dao.UserDao;
import com.gw.blog.web.admin.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;


/**
 * 用户业务处理层接口的实现
 *
 * @Title : UserServiceImpl
 * @Author : Ark
 * @Date : 2018/12/19 16:45
 * @Version : 1.0.0
 */
@Service
public class UserServiceImpl extends BasePageServiceImpl<User, UserDao> implements UserService {



    //更新用户信息
    @Override
    public BaseResult save(User user) {
        String result;
        if (user.getId() == null){
            if (user.getRole() == null){
                //非超级管理员新增用户只能是普通用户
                user.setRole(false);
            }
            result = BeanValidator.validator(user,BeanValidatorGroup.InsertUser.class);
        }
        else {
            result = BeanValidator.validator(user,BeanValidatorGroup.UpdateUser.class);
        }

        if (StringUtils.isBlank(result)){
            //查询是否已存在用户
            User existingUser = dao.getByLoginId(user);
            if (existingUser != null) {
                //判断已存在用户是否提交修改的用户,如果不是则不能提交，username为登录账户，必须唯一
                if (!existingUser.getId().equals(user.getId())){
                    result = "该用户名已存在，请重新输入";
                }
            }
        }

        if(StringUtils.isNotBlank(result)){
            return BaseResult.fail(result);
        }
        if(StringUtils.isNotBlank(user.getPassword())){
            String password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
            user.setPassword(password);
        }
        return super.save(user);
    }

    /**
     * 登录
     * @param params
     * @return
     */
    @Override
    public User login(User params){
        // 登录密码 MD5 加密
        String password = DigestUtils.md5DigestAsHex(params.getPassword().getBytes());
        User user = dao.getByLoginId(params);

        // 账号正确
        if (user != null) {
            // 密码正确
            if (user.getPassword().equals(password) || user.getPassword().equals(params.getPassword())) {
                return user;
            }
        }

        // 登录失败
        return null;

    }

    /**
     * 逻辑删除 用户
     * @param user 该user只是作为一个参数传递对象，并非删除对象
     * @return
     */
    @Override
    public BaseResult delete(User user) {
        if (user != null && Contents.SUPER_ADMIN_USER_ID.equals(user.getId())){
            return BaseResult.fail("违规操作！！！");
        }
        else if (user == null){
            return BaseResult.fail("参数异常");
        }

        String validator = BeanValidator.validator(user, BeanValidatorGroup.DeleteUser.class);
        if (StringUtils.isNotBlank(validator)){
            return BaseResult.fail(validator);
        }

        User operator = this.login(user);
        String resultMessage;
        if (operator == null) {
            resultMessage = "账号与密码不一致";
        }
        else {
            if (operator.getRole()) {
                User deleteUser = new User();
                deleteUser.setId(user.getId());
                deleteUser.setStatus(Contents.DELETE_STATUS);
                BaseResult delResult = super.save(deleteUser);
                delResult.setMessage("删除成功");
                return delResult;
            }
            else {
                resultMessage = "该用户无操作权限";
            }
        }

        return BaseResult.fail(resultMessage);
    }
}

 






