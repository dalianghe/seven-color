package com.github.dalianghe.admin.service;

import com.github.dalianghe.admin.entity.JcNoteComment;
import com.github.dalianghe.core.base.BaseService;
import com.github.dalianghe.core.util.JsonUtil;

public interface INoteCommentService extends BaseService<JcNoteComment,String> {

    JsonUtil delById(String id, boolean flag);

}
