package com.github.dalianghe.admin.mapper;

import com.github.dalianghe.admin.entity.JcNoteComment;
import com.github.dalianghe.core.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

public interface JcNoteCommentMapper extends BaseMapper<JcNoteComment,String> {

    int delById(@Param("commentId") Integer commentId);

}
