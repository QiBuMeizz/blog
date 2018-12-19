package com.gw.blog.web.admin.processor;

import com.gw.blog.domain.Content;
import com.gw.blog.web.admin.dao.ContentDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import us.codecraft.webmagic.ResultItems;
import us.codecraft.webmagic.Task;
import us.codecraft.webmagic.pipeline.Pipeline;

import java.util.Date;

public class MyPipeline implements Pipeline {
    private Logger logger = LoggerFactory.getLogger(FirstProcessor.class);
    public static ContentDao contentDao;
    private Long entityTypeId;

    public Long getEntityTypeId() {
        return entityTypeId;
    }

    public void setEntityTypeId(Long entityTypeId) {
        this.entityTypeId = entityTypeId;
    }

    @Override
    public void process(ResultItems resultItems, Task task) {
        String title = resultItems.get("title").toString();
        String content = resultItems.get("content").toString();
        Object pic = resultItems.get("picture");
        String picture = null;
        if(pic != null){
            picture = pic.toString();
        }
//        logger.info("title",title);
//        logger.info("content",content);
//        logger.info("picture",picture);
//        System.out.println("title:"+title);
//        System.out.println("content:"+content);
//        System.out.println("picture:"+picture);
        Content entity = new Content();
        Date date = new Date();
        entity.setTypeId(entityTypeId);
        entity.setAuthorId(1L);
        entity.setStatus(1);
        entity.setTitle(title);
        entity.setContent(content);
        if(picture != null && !"".equals(picture)){
            entity.setPic("www.funtl.com"+picture);
        }
        entity.setCreated(date);
        entity.setUpdated(date);
        try {
            contentDao.insert(entity);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
