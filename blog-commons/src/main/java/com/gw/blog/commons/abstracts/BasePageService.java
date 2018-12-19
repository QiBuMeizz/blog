package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BasePageEntity;
import com.gw.blog.commons.dto.BaseResult;

import java.util.List;
import java.util.Map;

public interface BasePageService<T extends BasePageEntity> extends BaseService<T> {
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

    /**
     * 自定义标签分页
     * @param entity
     * @return
     */
    BaseResult pageList(T entity);
}
