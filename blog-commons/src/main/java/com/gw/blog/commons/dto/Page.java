package com.gw.blog.commons.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class Page implements Serializable {
    /**
     * 当前页
     */
    private int current = 1;
    /**
     * 每页显示数
     */
    private int size = 3;
    /**
     * 偏移量
     */
    //private int start = (current-1)*size;
    public int getStart(){
        return  (current-1)*size;
    }
}
