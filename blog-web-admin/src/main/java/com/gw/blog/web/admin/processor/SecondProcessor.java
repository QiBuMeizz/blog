package com.gw.blog.web.admin.processor;

import us.codecraft.webmagic.Page;

/**
 * @description
 * 面试宝典
 * @author: ZivLee
 * @date: 2018/12/18 20:58
 * @className: SecondProcessor
 * @version: V1.0.0
*/
public class SecondProcessor extends BaseProcessor {

    public void process(Page page) {
        putField(page,"//html/body/div/section/div/div/div/ul/li/ul/li/a/@href");
    }
}
