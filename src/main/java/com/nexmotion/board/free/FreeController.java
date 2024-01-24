package com.nexmotion.board.free;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class FreeController {
    FreeService freeService;

    @RequestMapping("/free")
    public String freePage(Model model) {

        return "/free/free";
    }
    @RequestMapping("/freeWrite")
    public String freeWrite() {

        return "/free/freeWrite";
    }

    @RequestMapping("/free/details/{postId}")
    public String freeDetailsPage(@PathVariable String postId) {

        return "/free/freeDetails";
    }

}
