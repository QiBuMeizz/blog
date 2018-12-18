package com.gw.blog.domain;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Comment extends BaseEntity {
    /**
     * 评论的用户名
     */
    private String name;
    /**
     * 邮箱地址
     */
    private String email;
    /**
     * 评论详情
     */
    private String text;
    /**
     * 头像路径
     */
    private String pic;
    /**
     * 父评论ID
     */
    private Long parentId;
    /**
     * 内容ID
     */
    private Long contentId;
}
