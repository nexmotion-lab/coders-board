package com.nexmotion.board.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

    @RequestMapping("/notice")
    public String noticePage(){
        return "/notice/notice";
    }
    @RequestMapping("/noticeWrite")
    public String noticeWritePage(){ return "/notice/noticeWrite"; }
    @RequestMapping("/notice/details/{postId}")
    public String noticeDetailsPage(@PathVariable String postId){ return "/notice/noticeDetails"; }

    @RequestMapping("/noticeModify/{postId}")
    public String noticeModifyPage(@PathVariable String postId){return "/notice/noticeModify";}
}
