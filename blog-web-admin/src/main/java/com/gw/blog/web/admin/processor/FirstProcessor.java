package com.gw.blog.web.admin.processor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

/**
 * @description
 * 单体应用
 * @author: ZivLee
 * @date: 2018/12/18 17:23
 * @className: FirstProcessor
 * @version: V1.0.0
 */
public class FirstProcessor implements PageProcessor {
    private Site site = Site.me().setRetryTimes(3).setSleepTime(100);
    public void process(Page page) {
        page.addTargetRequests(page.getHtml().xpath("//html/body/div/section/div/div/div/ul/li/a[2]/@href").all());
        page.putField("title", page.getHtml().xpath("//html/body/div[2]/section[1]/div/div/div/h2/text()"));
        page.putField("content", page.getHtml().xpath("//html/body/div[2]/section[2]/div/div/div").toString());
        page.putField("picture", page.getHtml().xpath("//html/body/div[2]/section[2]/div/div/div/p/img/@src").toString());
        if (page.getResultItems().get("title") == null) {
            //跳过没有数据的页面
            page.setSkip(true);
        }
        if (page.getResultItems().get("content")==null){
            //skip this page
            page.setSkip(true);
        }
    }

    public Site getSite() {
        return site;
    }

}
