package com.gw.blog.commons.abstracts.entity;

import com.gw.blog.commons.dto.Page;
import lombok.Data;

@Data
public class BasePageEntity extends BaseEntity {
    /**
     * 分页
     */
    private Page page;
}
