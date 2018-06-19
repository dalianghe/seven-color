package com.github.dalianghe.admin.mapper;

import com.github.dalianghe.admin.entity.JcNote;
import com.github.dalianghe.core.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

public interface JcNoteMapper extends BaseMapper<JcNote,String> {

    int delById(@Param("noteId") Integer noteId);

}
