package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseTreeEntity;
import org.assertj.core.util.Lists;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 通用树形结构控制器
 */
public abstract class BaseTreeController<T extends BaseTreeEntity, S extends BaseTreeService<T>> extends BaseController<T, S>{
    /**
     * 排序
     * @param parentId  父节点 ID
     * @param sourceList
     * @param targetList
     * @return
     */
    protected List<T> sort(Long parentId, List<T> sourceList, List<T> targetList){
        for (T entity : sourceList) {
            if (parentId.equals(entity.getParentId())) {
                targetList.add(entity);
                sort(entity.getId(), sourceList, targetList);
            }
        }

        return targetList;
    }

    /**
     * 树形结构数据
     * @param parentId
     * @return
     */
    @ResponseBody
    @PostMapping(value = "tree")
    protected List<T> tree(Long parentId){
        List<T> list = Lists.newArrayList();
        if (parentId == null) {
            list = service.getByParentId(0L);
        }
        else {
            list = service.getByParentId(parentId);
        }
        return list;
    }



}
