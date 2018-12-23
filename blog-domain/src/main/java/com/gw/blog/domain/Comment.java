package com.gw.blog.domain;


import com.gw.blog.commons.abstracts.entity.BasePageEntity;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.gw.blog.commons.utils.RegexpUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@EqualsAndHashCode(callSuper = false)
public class Comment extends BasePageEntity {
    /**
     * 评论的用户名
     */
    @Length(min = 2, max = 20, message = "名字长度应位于 2--20 之间")
    private String name;
    /**
     * 邮箱地址
     */
    @Pattern(regexp = RegexpUtils.EMAIL, message = "邮箱格式不正确")
    private String email;
    /**
     * 评论详情
     */
    @Length(min = 1, max = 120, message = "内容长度不能超过120个字符")
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
    @NotNull
    private Long contentId;
    /**
     * 文章标题
     */
    @Transient
    private Content content;
    /**
     * 父评论名字
     */
    @Transient
    private String parentName;
}
