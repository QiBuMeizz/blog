package com.gw.blog.domain;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.utils.RegexpUtils;
import com.gw.blog.commons.validation.BeanValidatorGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


@Data
@EqualsAndHashCode(callSuper = false)
public class User extends BaseEntity {
    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空", groups = {BeanValidatorGroup.InsertUser.class,BeanValidatorGroup.UpdateUser.class})
    @Length(min = 6, max = 20, message = "用户名长度为 6 -- 20 之间", groups = {BeanValidatorGroup.InsertUser.class,BeanValidatorGroup.UpdateUser.class})
    private String username;
    /**
     * 密码
     */
    @Length(min = 6, max = 20, message = "密码长度为 6 -- 20 之间", groups = {BeanValidatorGroup.InsertUser.class})
    private String password;
    /**
     * 头像路径
     */
    private String pic;
    /**
     * 邮箱
     */
    @NotBlank(message = "邮箱不能为空", groups = {BeanValidatorGroup.InsertUser.class,BeanValidatorGroup.UpdateUser.class})
    @Email(regexp = RegexpUtils.EMAIL,message = "邮箱格式不正确", groups = {BeanValidatorGroup.InsertUser.class,BeanValidatorGroup.UpdateUser.class})
    private String email;
    /**
     * 电话号码
     */
    @NotBlank(message = "手机号不能为空", groups = {BeanValidatorGroup.InsertUser.class,BeanValidatorGroup.UpdateUser.class})
    @Pattern(regexp = RegexpUtils.PHONE,message = "手机号格式不正确", groups = {BeanValidatorGroup.InsertUser.class,BeanValidatorGroup.UpdateUser.class})
    private String phone;
    /**
     * 角色
     * false为普通,true为管理员
     */
    @Pattern(regexp = Contents.ROLE_REGEXP, message = "请为用户配置角色", groups = {BeanValidatorGroup.InsertUser.class})
    private Boolean role;

}
