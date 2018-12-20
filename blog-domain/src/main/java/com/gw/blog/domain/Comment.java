package com.gw.blog.domain;


import com.gw.blog.commons.abstracts.entity.BasePageEntity;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;

@Data
@EqualsAndHashCode(callSuper = false)
public class Comment extends BasePageEntity {
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
     * 是否有回复，0-false，1-true
     */
    @JsonProperty("isParent")
    private Boolean isParent;
    /**
     * 父评论ID
     */
    private Long parentId;
    /**
     * 内容ID
     */
    private Long contentId;
	/**
     * 文章标题
     */
    @Transient
	/**
     * 父评论名字
     */
    @Transient
    private String parentName;
