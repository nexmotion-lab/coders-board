package com.nexmotion.board.free;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeController {

    @RequestMapping("/free")
    public String noticePage() {

        return "/free/free";
    }

}
