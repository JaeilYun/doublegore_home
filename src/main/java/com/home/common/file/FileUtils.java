package com.home.common.file;

import com.home.contents.file.entity.FileEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtils {
    private static final Logger logger = LoggerFactory.getLogger(FileUtils.class);

    public static String fileSave(String uploadPath, MultipartFile multipartFile, String genId, String nodeId) throws IOException {
        File uploadPathDir = new File(uploadPath);

        if ( !uploadPathDir.exists() ){
            uploadPathDir.mkdirs();
        }

        String originalfileName = "";
        String saveFileName = "";
        String savePath = "";

        originalfileName = multipartFile.getOriginalFilename();
        String fileExtension = getExtension(originalfileName);
        saveFileName = genId + "." + fileExtension;

        savePath = makeDir(uploadPath, nodeId);

        File target = new File(uploadPath + savePath, saveFileName);

        FileCopyUtils.copy(multipartFile.getBytes(), target);

        return makeFilePath(uploadPath, savePath, saveFileName);
    }

    public static String fileMove(String deletePath, FileEntity file) throws IOException {
        File deletePathDir = new File(deletePath);
        String outputFilePath = deletePath + File.separatorChar + file.getFileKey() + "." + getExtension(file.getFileName());
        if ( !deletePathDir.exists() ){
            deletePathDir.mkdirs();
        }

        FileInputStream fis = new FileInputStream(file.getFilePath());
        FileOutputStream fos = new FileOutputStream(outputFilePath);

        int data = 0;
        while((data=fis.read())!=-1) {
            fos.write(data);
        }
        fis.close();
        fos.close();

        //복사한뒤 원본파일을 삭제함
        fileDelete(file.getFilePath());
        return outputFilePath;
    }

    public static void fileDelete(String deleteFileName) {
        File file = new File(deleteFileName);
        file.delete();
    }

    public static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');

        if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
    }

    private static String makeDir(String uploadPath, String nodeId) {
        File dirPath = new File(uploadPath + File.separatorChar + nodeId);
        if (!dirPath.exists()) {
            dirPath.mkdir();
        }
        return File.separatorChar + nodeId;
    }

    private static String makeFilePath(String uploadPath, String path, String fileName) throws IOException {
        String filePath = uploadPath + path + "/" + fileName;
        return filePath.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }
}
