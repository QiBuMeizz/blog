package com.gw.blog.domain;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.abstracts.entity.BasePageEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

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
    @Length(min = 4,message = "标题不能少于4个字符")
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
    @Length(min = 10,message = "内容不能少于10个字符")
    private String content;
    /**
     * 标题描述
     */
    @Length(max = 30,message = "内容长度不能超30个字符")
    private String titleDesc;
    /**
     * 阅读量
     */
    private Long reads;

    //----------------------------------------------------------------

    /**
     * 作者名称
     */
    @Transient
    private User user;

    /**
     * 类别名称
     */
    private String typeName;
}
