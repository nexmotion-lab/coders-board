package com.nexmotion.board.attach;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttachController {
    @RequestMapping("/attach")
    public String newspage(){
        return "/attach/attach";
    }

}
