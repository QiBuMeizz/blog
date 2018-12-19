package com.gw.blog.web.admin.test;

import com.gw.blog.web.admin.dao.ContentDao;
import com.gw.blog.web.admin.processor.FirstProcessor;
import com.gw.blog.web.admin.processor.MyPipeline;
import com.gw.blog.web.admin.processor.SecondProcessor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.pipeline.Pipeline;
import us.codecraft.webmagic.processor.PageProcessor;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml","classpath:spring-context-druid.xml","classpath:spring-context-mybatis.xml"})
public class TestProcessor {
    @Autowired
    private ContentDao contentDao;

    /**
     * 爬单体应用
     */
    @Test
    public void testFirstProcessor(){
        getData("http://www.funtl.com/2018/06/03/contents/Java-单体应用/",new FirstProcessor(),new MyPipeline());
    }
    /**
     * 爬面试宝典
     */
    @Test
    public void testSecondProcessor(){
        getData("http://www.funtl.com/2018/04/07/contents/Java-面试宝典/", new SecondProcessor(),new MyPipeline());
    }


    /**
     *
     * @param url 初始入口url
     * @param processor 自定义的规则类
     * @param pipeline 自定义处理结果类
     */
    private void getData(String url, PageProcessor processor, Pipeline pipeline) {
        MyPipeline.contentDao=contentDao;
        Spider.create(processor)
                .addUrl(url)
                .addPipeline(pipeline)
                .thread(5)
                .run();
    }

}
