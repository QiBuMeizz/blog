package com.gw.blog.commons.dto;

import com.gw.blog.commons.abstracts.entity.BaseEntity;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * dataTables
 * 分页数据传输对象
 * @param <T>
 */
@Data
public class PageInfo<T extends BaseEntity> implements Serializable {
    /**
     * 返回的状态值
     */
    private Integer draw ;
    /**
     * 数据总条数
     */
    private Integer recordsTotal;
    /**
     * 过滤后的总条数
     */
    private Integer recordsFiltered;
    /**
     * 传输的数据集合
     */
    private List<T> data;
}
