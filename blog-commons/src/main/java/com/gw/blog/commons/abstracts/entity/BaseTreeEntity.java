package com.gw.blog.commons.abstracts.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class BaseTreeEntity extends BaseEntity {

    /**
     * 父类ID
     */
    private Long parentId;

    /**
     * 类目名称
     */
    private String name;

    /**
     * 是否为父目录
     */
    private Boolean isParent;

    /**
     * 排序序号
     */
    private Integer sortOrder;
}
