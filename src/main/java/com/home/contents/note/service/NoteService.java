package com.home.contents.note.service;

import com.home.common.file.FileUtils;
import com.home.contents.file.entity.FileEntity;
import com.home.contents.file.entity.JsonEntity;
import com.home.contents.file.repository.FileRepository;
import com.home.contents.file.repository.JsonRepository;
import com.home.contents.note.entity.NoteCategoryEntity;
import com.home.contents.note.repository.NoteCategoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;

@Service
@Transactional
public class NoteService {
    private static final Logger logger = LoggerFactory.getLogger(NoteService.class);

    @Autowired
    NoteCategoryRepository noteCategoryRepository;

    public List<NoteCategoryEntity> findNoteCategoryList() {
        return noteCategoryRepository.findAll();
    }
}
