package com.github.dalianghe.admin.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@ToString
public class JcNoteComment implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer commentId;

    private Integer userId;

    private String content;

    private Date createTime;

    private Integer noteId;
}
