package com.gw.blog.web.admin.service.impl;

import com.gw.blog.commons.abstracts.impl.BaseTreeServiceImpl;
import com.gw.blog.commons.contants.Contents;
import com.gw.blog.commons.dto.BaseResult;
import com.gw.blog.domain.Type;
import com.gw.blog.web.admin.dao.TypeDao;
import com.gw.blog.web.admin.service.TypeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl extends BaseTreeServiceImpl<Type, TypeDao> implements TypeService {

    /**
     * 删除
     */
    @Override
    public BaseResult delete(Type type){
        List<Type> list = getByParentId(type.getId());
        if (list != null) {
            for (Type child : list) {
                child.setStatus(Contents.DELETE_STATUS);
                dao.delete(child);
            }
        }
        type.setStatus(Contents.DELETE_STATUS);
        dao.delete(type);
        return BaseResult.success("删除数据成功!!!");
    }

    /**
     * 保存
     */
    @Override
    public BaseResult save(Type type) {
        String message = check(type);

        // 正确
        if (message == null) {
            //true/新增
            if(type.insertOrUpdate(type)){
                dao.insert(type);
            }
            //false/更新
            else {
                dao.update(type);
            }
            return BaseResult.success();
        }

        return BaseResult.fail(message);
    }

    /**
     * 正确性检查
     * 规定可选父类的范围
     * @param type
     * @return
     */
    @Override
    public String check(Type type) {
        Long id = type.getId();
        Long parentId = type.getParentId();
        Type parent = selectById(parentId);
        // 新增
        if (id == null) {
            // 无父类或父类无父类
            if (parentId == 0L || parent.getParentId() == 0L) {
                // 限制父类个数
                if (getByParentId(0L).size() < 9 || getByParentId(parentId).size() < 9) {
                    // 改变父类 isParent 值
                    turnIsParent(parent, null);
                    return null;
                }

                else {
                    return "父类个数不能超过8个";
                }
            }
        }

        // 更新
        else {
            // 本类不可为自身类的父类
            if (id != parentId) {
                Type oldType = selectById(id);
                // 无父类或父类无父类
                if (parentId == 0L || parent.getParentId() == 0L) {
                    // 改变父类 isParent 值
                    turnIsParent(parent, oldType);
                    return null;
                }
            }
        }
        return "此分类不能成为父类";
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
