package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseEntity;

import java.util.List;
import java.util.Map;

public interface BasePageService<T extends BaseEntity> {
    /**
     * 分页
     * @param map
     * @return
     */
    List<T> page(Map<String,Object> map);

    /**
     * 获取总条数
     * @return
     */
    Integer count(T entity);
}
