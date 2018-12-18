package com.gw.blog.commons.abstracts.impl;

import com.gw.blog.commons.abstracts.BaseDao;
import com.gw.blog.commons.abstracts.BaseService;
import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.dto.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public abstract class BaseServiceImpl<T extends BaseEntity,D extends BaseDao<T>> implements BaseService<T> {

    @Autowired
    protected D dao;

    /**
     * 伪删除,状态值变为0
     * @param entity
     * @return 修改结果
     */
    @Override
    public BaseResult delete(T entity) {
        dao.delete(entity);
        return BaseResult.success();
    }

    /**
     * 保存数据
     * @param entity
     * @return 修改结果
     */
    @Override
    public BaseResult save(T entity) {
        Date date = new Date();
        //设置更新时间
        entity.setUpdated(date);
        if(entity.getId() == null){
            entity.setCreated(date);
            dao.insert(entity);
        }
        else {
            dao.update(entity);
        }

        return BaseResult.success();
    }

    /**
     * 通过id获取数据
     * @param id
     * @return 返回的数据
     */
    @Override
    public T selectById(Long id) {
        T entity = dao.selectById(id);
        return entity;
    }
}
