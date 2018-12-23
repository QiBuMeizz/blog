package com.gw.blog.commons.abstracts.impl;

import com.gw.blog.commons.abstracts.BaseDao;
import com.gw.blog.commons.abstracts.BaseService;
import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ConcurrentModificationException;
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
        entity.setStatus(Contents.DELETE_STATUS);
        dao.delete(entity);
        return BaseResult.success("删除数据成功!!!");
    }

    /**
     * 保存数据
     * @param entity
     * @return 修改结果
     */
    @Override
    public BaseResult save(T entity) {
        //true/新增
        if(entity.insertOrUpdate(entity)){
            dao.insert(entity);
        }
        //false/更新
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
