package com.github.dalianghe.admin.controller;

import com.github.dalianghe.admin.entity.Investigate;
import com.github.dalianghe.admin.service.IinvestigateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/investigate")
public class InvestigateController {

    @Autowired
    IinvestigateService investigateService;

    @GetMapping("")
    public String investigate(){
        return "investigate/question";
    }

    @PostMapping("/save")
    @ResponseBody
    public String save(Integer q1,Integer q2,Integer q3,String q4,Integer q5,Integer q6,Integer q7,Integer q8,Integer q9){
        Investigate investigate = new Investigate();
        if(null!=q1){
            investigate.setQuestion1(q1==1?"男":"女");
        }
        String sq2 = null;
        if(null!=q2){
            switch (q2){
                case 1:
                    sq2 = "18岁以下"; break;
                case 2:
                    sq2 = "18~25"; break;
                case 3:
                    sq2 = "26~30"; break;
                case 4:
                    sq2 = "31~40"; break;
                case 5:
                    sq2 = "41~50"; break;
                case 6:
                    sq2 = "51~60"; break;
                case 7:
                    sq2 = "60以上"; break;
                default:
                    sq2 = "";
            }
        }
        investigate.setQuestion2(sq2);
        String sq3 = null;
        if(null!=q3){
            switch (q3) {
                case 1:
                    sq3 = "非常好看"; break;
                case 2:
                    sq3 = "一般"; break;
                case 3:
                    sq3 = "不好看"; break;
                default:
                    sq3 = "";
            }
        }
        investigate.setQuestion3(sq3);
        investigate.setQuestion4(q4);
        if(null!=q5){
            investigate.setQuestion5(q5==1?"抽":"不抽");
        }
        String sq6 = null;
        if(q6!=null){
            if(null!=q6){
                switch (q6) {
                    case 1:
                        sq6 = "无穷尽的加班TIME"; break;
                    case 2:
                        sq6 = "来去匆匆的地铁站口"; break;
                    case 3:
                        sq6 = "斑斓喧嚣的酒吧"; break;
                    default:
                        sq6 = "";
                }
            }
        }
        investigate.setQuestion6(sq6);
        if(null!=q7){
            investigate.setQuestion7(q7==1?"是":"否");
        }
        String sq8 = null;
        if(q8!=null){
            if(null!=q8){
                switch (q8) {
                    case 1:
                        sq8 = "无穷尽的加班TIME"; break;
                    case 2:
                        sq8 = "来去匆匆的地铁站口"; break;
                    case 3:
                        sq8 = "斑斓喧嚣的酒吧"; break;
                    default:
                        sq8 = "";
                }
            }
        }
        investigate.setQuestion8(sq8);
        String sq9 = null;
        if(q9!=null){
            if(null!=q9){
                switch (q9) {
                    case 1:
                        sq9 = "无穷尽的加班TIME"; break;
                    case 2:
                        sq9 = "来去匆匆的地铁站口"; break;
                    case 3:
                        sq9 = "斑斓喧嚣的酒吧"; break;
                    default:
                        sq9 = "";
                }
            }
        }
        investigate.setQuestion9(sq9);
        investigateService.insert(investigate);
        return "1";
    }

}
