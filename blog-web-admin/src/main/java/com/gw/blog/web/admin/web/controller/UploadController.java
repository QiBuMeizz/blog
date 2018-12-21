package com.gw.blog.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 图片上传控制器
 * wangEditor
 * Dropzone
 */
@Controller
public class UploadController {


    private static final String FILE_UPLOAD_PATH = "static" + File.separator + "assets"+ File.separator + "back"+ File.separator+"upload";

    /**
     * 上传
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "upload")
    public Map<String, Object> upload(MultipartFile dropFile, MultipartFile[] editorFiles, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        // Dropzone 上传
        if (dropFile != null) {
            result.put("filePath", write(request, dropFile));
        }

        // wangEditor 上传
        else {
            List<String> filePaths = new ArrayList<>();
            for (MultipartFile editorFile : editorFiles) {
                filePaths.add(write(request, editorFile));
            }
            result.put("errno", 0);
            result.put("data", filePaths);
        }

        return result;
    }

    /**
     * 写文件
     * @param request
     * @param multipartFile
     * @return 文件路径
     */
    private String write(HttpServletRequest request, MultipartFile multipartFile) {
        // 获取上传路径
        String realPath = request.getSession().getServletContext().getRealPath("/");
        String filePath = realPath + FILE_UPLOAD_PATH;

        // 先判断上传路径是否存在
        File file = new File(filePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        // 获取文件名后缀
        String name = multipartFile.getOriginalFilename();
        String suffix = name.substring(name.lastIndexOf("."));
        String filename = UUID.randomUUID().toString().replace("-", "") + suffix;
        File uploadFile = new File(filePath + File.separator + filename);

        try {
            multipartFile.transferTo(uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return String.format("%s://%s:%s/%s/%s", request.getScheme(), request.getServerName(), request.getServerPort(), FILE_UPLOAD_PATH, filename);
    }
}
