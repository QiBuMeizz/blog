package com.gw.blog.domain;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.abstracts.entity.BasePageEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Content extends BasePageEntity {
    /**
     * 所属分类ID
     */
    private Long typeId;
    /**
     * 文章标题
     */
    private String title;
    /**
     * 作者ID
     */
    private Long authorId;
    /**
     * 头像路径
     */
    private String pic;
    /**
     * 文章中主要内容
     */
    private String content;
    /**
     * 标题描述
     */
    private String titleDesc;
    /**
     * 阅读量
     */
    private Long reads;
}
