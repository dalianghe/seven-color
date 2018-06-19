package com.github.dalianghe.admin.controller;

import com.github.dalianghe.admin.entity.JcNoteComment;
import com.github.dalianghe.admin.service.INoteCommentService;
import com.github.dalianghe.core.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private INoteCommentService iNoteCommentService;

    @GetMapping(value = "/commentList")
    public String commentList() {
        return "admin/comment/commentList";
    }

    @GetMapping(value = "/commentListData")
    @ResponseBody
    public String commentListData(JcNoteComment node, String page, String limit) {
        return iNoteCommentService.show(node, Integer.valueOf(page), Integer.valueOf(limit));
    }

    @PostMapping(value = "/del")
    @ResponseBody
    public JsonUtil del(String id, boolean flag) {
        return iNoteCommentService.delById(id, flag);
    }

}
