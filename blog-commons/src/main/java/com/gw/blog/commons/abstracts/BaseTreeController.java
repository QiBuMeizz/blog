package com.gw.blog.commons.abstracts;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import com.gw.blog.commons.abstracts.entity.BaseTreeEntity;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * 通用树形结构控制器
 */
@Controller
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
}
