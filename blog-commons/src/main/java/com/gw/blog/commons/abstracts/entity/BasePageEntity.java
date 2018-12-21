package com.gw.blog.commons.abstracts.entity;

import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.commons.dto.Page;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class BasePageEntity extends BaseEntity {
    /**
     * 分页
     */
    private Page page;


}
