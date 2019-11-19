package com.gw.blog.commons.abstracts.entity;

import com.gw.blog.commons.validation.BeanValidatorGroup;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Data
public abstract class BaseEntity implements Serializable {
    /**
     * 对象的id
     */
    @NotNull(message = "id 不能为空", groups = {BeanValidatorGroup.DeleteUser.class})
    private Long id;
    /**
     * 更新时间
     */
    private Date updated;
    /**
     * 创建时间
     */
    private Date created;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 判断是新增还是更新并设置时间
     * @param baseEntity
     * @return true/新增 false/更新
     */
    public boolean insertOrUpdate(BaseEntity baseEntity){
        Date date = new Date();
        //设置更新时间
        baseEntity.setUpdated(date);
        if(baseEntity.getId() == null) {
            baseEntity.setCreated(date);
            return true;
        }
        else {
            return false;
        }
    }
}
