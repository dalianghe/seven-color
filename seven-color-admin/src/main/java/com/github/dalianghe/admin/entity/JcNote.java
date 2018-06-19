package com.github.dalianghe.admin.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@ToString
public class JcNote implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer noteId;

    private String noteTitle;

    private String noteContent;

    private Date createTime;

    private Integer userId;

    private String noteType;

    private String noteImg;

}
