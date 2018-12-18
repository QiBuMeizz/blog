package com.gw.blog.commons.abstracts.impl;

import com.gw.blog.commons.abstracts.BaseTreeDao;
import com.gw.blog.commons.abstracts.BaseTreeService;
import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.abstracts.entity.BaseTreeEntity;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public abstract class BaseTreeServiceImpl<T extends BaseTreeEntity,D extends BaseTreeDao<T>> extends BaseServiceImpl<T,D> implements BaseTreeService<T>{

    /**
     * 查询所有数据
     * @return
     */
    @Override
    public List<T> selectAll() {
        List<T> list = dao.selectAll();

        return list;
    }

    /**
     * 查询总条数
     * @param parentId
     * @return
     */
    @Override
    public List<T> getByParentId(Long parentId) {
        return dao.getByParentId(parentId);
    }
}
