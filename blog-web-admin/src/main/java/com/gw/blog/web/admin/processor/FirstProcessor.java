package com.gw.blog.web.admin.processor;

import us.codecraft.webmagic.Page;

/**
 * @description
 * 单体应用
 * @author: ZivLee
 * @date: 2018/12/18 17:23
 * @className: FirstProcessor
 * @version: V1.0.0
 */
public class FirstProcessor extends BaseProcessor {
    public void process(Page page) {
        putField(page,"//html/body/div/section/div/div/div/ul/li/a[2]/@href");
    }
}
