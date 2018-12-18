package com.gw.blog.web.admin.processor;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.processor.PageProcessor;

public abstract class BaseProcessor implements PageProcessor {
    private Site site = Site.me().setRetryTimes(3).setSleepTime(100);
    public Site getSite() {
        return site;
    }
    protected void putField(Page page, String urlXpath){
        page.addTargetRequests(page.getHtml().xpath(urlXpath).all());
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
}
