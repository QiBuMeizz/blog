package com.gw.blog.domain;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.utils.RegexpUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


@Data
@EqualsAndHashCode(callSuper = false)
public class User extends BaseEntity {
    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空")
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 头像路径
     */
    private String pic;
    /**
     * 邮箱
     */
    @NotBlank(message = "邮箱不能为空")
    @Email(regexp = RegexpUtils.EMAIL,message = "邮箱格式不正确")
    private String email;
    /**
     * 电话号码
     */
    @NotBlank(message = "手机号不能为空")
    @Pattern(regexp = RegexpUtils.PHONE,message = "手机号格式不正确")
    private String phone;
    /**
     * 角色
     * false为普通,true为管理员
     */
    private Boolean role;

}
