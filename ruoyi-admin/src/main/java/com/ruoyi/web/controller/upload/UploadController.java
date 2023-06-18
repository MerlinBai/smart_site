//package com.ruoyi.web.controller.upload;
//
//import com.ruoyi.common.core.domain.AjaxResult;
//import com.ruoyi.video.utils.AliOSSUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.IOException;
//
//import static com.ruoyi.common.core.domain.AjaxResult.success;
//
//
//@RestController
//@RequestMapping("/video")
//public class UploadController {
//
//    @Autowired
//    private AliOSSUtils aliOSSUtils;
//
//    @PostMapping("/upload")
//    public AjaxResult upload(MultipartFile file) throws IOException {
//
//        String url = aliOSSUtils.upload(file);
//
//        return success(url);
//    }
//}