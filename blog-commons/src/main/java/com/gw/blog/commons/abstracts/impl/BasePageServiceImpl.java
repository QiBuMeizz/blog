package com.gw.blog.commons.abstracts.impl;

import com.gw.blog.commons.abstracts.BasePageDao;
import com.gw.blog.commons.abstracts.BasePageService;
import com.gw.blog.commons.abstracts.BaseService;
import com.gw.blog.commons.abstracts.entity.BaseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public abstract class BasePageServiceImpl<T extends BaseEntity,D extends BasePageDao<T>> extends BaseServiceImpl<T,D> implements BasePageService<T> {

    /**
     * 分页
     * @param map
     * @return
     */
    @Override
    public List<T> page(Map<String, Object> map) {
        return dao.page(map);
    }

    /**
     * 查询总数
     * @param entity
     * @return
     */
    @Override
    public Integer count(T entity) {
        return dao.count(entity);
    }
}
