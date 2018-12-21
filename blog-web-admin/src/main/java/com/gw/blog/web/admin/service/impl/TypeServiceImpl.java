package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BaseTreeServiceImpl;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.dao.TypeDao;
import com.gw.blog.web.admin.service.TypeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl extends BaseTreeServiceImpl<Type, TypeDao> implements TypeService {

    



    /**
     * 正确性检查
     * 规定可选父类的范围
     * @param type
     * @return
     */
    @Override
    public BaseResult check(Type type) {
        Long id = type.getId();
        Long parentId = type.getParentId();
        Type parent = selectById(parentId);
        String message = null;
        // 新增
        if (id == null) {
            // 无父类或父类无父类
            if (parentId == 0L || parent.getParentId() == 0L) {

                // 限制父类个数
                if (getByParentId(0L).size() < 9 || getByParentId(parentId).size() < 9) {
                    BaseResult baseResult = save(type);
                    // 改变父类 isParent 值
                    turnIsParent(parent, null);
                    return baseResult;
                }
                else{
                    message="";
                }
            }
            else{
                message="";
            }
        }

        // 更新
        else {
            // 本类不可为自身类的父类
            if (id != parentId) {
                Type oldType = selectById(id);
                // 无父类或父类无父类
                if (parentId == 0L || parent.getParentId() == 0L) {
                    save(type);
                    // 改变父类 isParent 值
                    turnIsParent(parent, oldType);
                    return null;
                }
            }
        }

        return BaseResult.fail(message);
    }

    /**
     * 改变父类 isParent 值
     * @param parent
     */
    private void turnIsParent(Type parent, Type oldType) {

        // 新晋父类
        if (parent != null) {
            if (!parent.getIsParent()) {
                parent.setIsParent(true);
                save(parent);
            }
        }

        // 无子类
        if (oldType != null) {
            if (getByParentId(oldType.getParentId()).size() == 0) {
                Type oldParent = selectById(oldType.getParentId());
                oldParent.setIsParent(false);
                save(oldParent);
            }
        }
    }

}
