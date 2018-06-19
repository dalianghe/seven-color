package com.github.dalianghe.admin.service;

import com.github.dalianghe.admin.entity.JcNote;
import com.github.dalianghe.core.base.BaseService;
import com.github.dalianghe.core.util.JsonUtil;

public interface INoteService extends BaseService<JcNote,String> {

    JsonUtil delById(String id, boolean flag);

}
