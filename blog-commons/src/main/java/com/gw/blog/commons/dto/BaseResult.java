package com.gw.blog.commons.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 数据状态返回对象
 */
@Data
public class BaseResult implements Serializable {

    /**
     * 成功的状态值
     */
    public static final int STATUS_SUCCESS = 200;
    /**
     * 失败的状态值
     */
    public static final int STATUS_FAIL = 500;

    /**
     * 状态值
     */
    private int status ;
    /**
     * 携带的信息
     */
    private String message;
    /**
     * 携带的数据
     */
    private Object data;

    /**
     * 创建无参的成功数据信息对象,默认的信息为 "成功"
     * @return
     */
    public static BaseResult success(){
        return creatBaseResult(STATUS_SUCCESS,"操作成功",null);
    }

    /**
     * 创建成功数据信息对象
     * @param message 成功的消息
     * @return
     */
    public static BaseResult success(String message){
        return creatBaseResult(STATUS_SUCCESS,message,null);
    }

    /**
     * 创建成功数据信息对象
     * @param message 成功的消息
     * @param data 携带的对象
     * @return
     */
    public static BaseResult success(String message,Object data){
        return creatBaseResult(STATUS_SUCCESS,message,data);
    }

    /**
     * 创建无参的成功数据信息对象,默认的信息为 "失败"
     * @return
     */
    public static BaseResult fail(){
        return creatBaseResult(STATUS_FAIL,"操作失败",null);
    }

    /**
     * 创建失败数据信息对象
     * @param message 失败的消息
     * @return
     */
    public static BaseResult fail(String message){
        return creatBaseResult(STATUS_FAIL,message,null);
    }

    /**
     * 创建失败数据信息对象
     * @param message 失败的消息
     * @param data 携带的对象
     * @return
     */
    public static BaseResult fail(String message,Object data){
        return creatBaseResult(STATUS_FAIL,message,data);
    }

    /**
     * 创建BaseResult对象
     * @param status 状态值 200(成功), 500(失败)
     * @param message 携带的消息
     * @param data 携带的对象
     * @return 新的BaseResult对象
     */
    private static BaseResult creatBaseResult(int status , String message ,Object data ){
        BaseResult baseResult = new BaseResult();
        baseResult.setStatus(status);
        baseResult.setMessage(message);
        baseResult.setData(data);
        return baseResult;
    }
}
