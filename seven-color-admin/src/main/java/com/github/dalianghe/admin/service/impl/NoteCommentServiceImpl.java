package com.github.dalianghe.admin.service.impl;

import com.github.dalianghe.admin.entity.JcNoteComment;
import com.github.dalianghe.admin.mapper.JcNoteCommentMapper;
import com.github.dalianghe.admin.service.INoteCommentService;
import com.github.dalianghe.core.base.BaseMapper;
import com.github.dalianghe.core.base.impl.BaseServiceImpl;
import com.github.dalianghe.core.exception.MyException;
import com.github.dalianghe.core.util.JsonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoteCommentServiceImpl extends BaseServiceImpl<JcNoteComment,String> implements INoteCommentService {

    @Autowired
    JcNoteCommentMapper jcNoteContentMapper;

    @Override
    public BaseMapper<JcNoteComment, String> getMappser() {
        return jcNoteContentMapper;
    }

    @Override
    public JsonUtil delById(String id, boolean flag) {
        if (StringUtils.isEmpty(id)) {
            return JsonUtil.error("获取数据失败");
        }
        JsonUtil j = new JsonUtil();
        try {
            //物理
            jcNoteContentMapper.delById(Integer.parseInt(id));
            j.setMsg("删除成功");
        } catch (MyException e) {
            j.setMsg("删除失败");
            j.setFlag(false);
            e.printStackTrace();
        }
        return j;

    }
}
