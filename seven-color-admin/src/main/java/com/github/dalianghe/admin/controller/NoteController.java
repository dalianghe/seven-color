package com.github.dalianghe.admin.controller;

import com.github.dalianghe.admin.entity.JcNote;
import com.github.dalianghe.admin.service.INoteService;
import com.github.dalianghe.core.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/note")
public class NoteController {

    @Autowired
    INoteService noteService;

    @GetMapping(value = "/noteList")
    public String noteList() {
        return "admin/note/noteList";
    }

    @GetMapping(value = "/noteListData")
    @ResponseBody
    public String noteListData(JcNote node, String page, String limit) {
        return noteService.show(node, Integer.valueOf(page), Integer.valueOf(limit));
    }

    @PostMapping(value = "/del")
    @ResponseBody
    public JsonUtil del(String id, boolean flag) {
        return noteService.delById(id, flag);
    }

}
