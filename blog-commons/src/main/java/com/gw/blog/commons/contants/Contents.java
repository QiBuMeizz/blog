package com.gw.blog.commons.contants;

/**
 * 放置各种常量
 */
public final class Contents {
    public static final String SESSION_USER = "user";
    public static final String SYSTEM_MESSAGE = "message";
    public static final String COOKIE_USER = "userInfo";
    public static final String BASE_RESULT = "baseResult";
    /**
     * 提交评论返回的结果的key
     */
    public static final String COMMENT_RESULT = "commentResult";/**
     * 提交回复返回的结果的key
     */
    public static final String RESPOND_RESULT = "respondResult";
    public static final Integer DELETE_STATUS = 0;
    /**
     * 匹配 0 、1 正则表达式
     */
    public static final String ROLE_REGEXP = "^[01]{1}$";
    /**
     * 修改密码格式限制  正则
     */
    public static final String MODIFY_PASSWOED_REGEXP = "^[A-Za-z0-9]{0}$|^[A-Za-z0-9]{6,20}$";
    public static final String UPDATE_USER_KEY = "updateUser";
    /**
     * 超级管理员id
     */
    public static final Long SUPER_ADMIN_USER_ID = 1L;
}
