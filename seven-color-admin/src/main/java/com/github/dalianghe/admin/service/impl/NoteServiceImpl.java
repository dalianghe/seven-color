package com.github.dalianghe.admin.service.impl;

import com.github.dalianghe.admin.entity.JcNote;
import com.github.dalianghe.admin.mapper.JcNoteMapper;
import com.github.dalianghe.admin.service.INoteService;
import com.github.dalianghe.core.base.BaseMapper;
import com.github.dalianghe.core.base.impl.BaseServiceImpl;
import com.github.dalianghe.core.exception.MyException;
import com.github.dalianghe.core.util.JsonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoteServiceImpl extends BaseServiceImpl<JcNote,String> implements INoteService {

    @Autowired
    JcNoteMapper jcNoteMapper;

    @Override
    public BaseMapper<JcNote, String> getMappser() {
        return jcNoteMapper;
    }

    @Override
    public JsonUtil delById(String id, boolean flag) {
        if (StringUtils.isEmpty(id)) {
            return JsonUtil.error("获取数据失败");
        }
        JsonUtil j = new JsonUtil();
        try {
            //物理
            jcNoteMapper.delById(Integer.parseInt(id));
            j.setMsg("删除成功");
        } catch (MyException e) {
            j.setMsg("删除失败");
            j.setFlag(false);
            e.printStackTrace();
        }
        return j;

    }
}
