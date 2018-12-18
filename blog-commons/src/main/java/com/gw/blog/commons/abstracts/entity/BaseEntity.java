package com.gw.blog.commons.abstracts.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public abstract class BaseEntity implements Serializable {
    /**
     * 对象的id
     */
    private Long id;
    /**
     * 更新时间
     */
    private Date updated;
    /**
     * 创建时间
     */
    private Date created;

    /**
     * 状态
     */
    private Integer status;

}
