package com.nexmotion.board.notice;

import com.nexmotion.board.account.AccountService;
import com.nexmotion.board.common.ResponseObject;
import com.nexmotion.board.common.StatusCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
public class NoticeRestController {

    private final Logger logger = LoggerFactory.getLogger(NoticeRestController.class);

    @Autowired
    NoticeService noticeService;
    @Autowired
    AccountService accountService;

    @RequestMapping("/notice/select")
    public ResponseObject<List<Notice>> select(
            @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize) throws Throwable {

        ResponseObject<List<Notice>> ret = new ResponseObject<>();
        List<Notice> noticeList = null;

        try {
            noticeList = noticeService.selectNotice(page, pageSize);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(noticeError)", e);
            return ret;
        }
        ret.setData(noticeList);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/notice/insert")
    public ResponseObject<List<Notice>> insert(
            @RequestParam(value = "postContent", required = true) String postContent,
            @RequestParam(value = "postTitle", required = true) String postTitle) throws Throwable{

        ResponseObject<List<Notice>> ret = new ResponseObject<>();
        Notice notice = new Notice();

        String userid = accountService.getCurrentUsername();
        String memberName = accountService.getAccount(userid).getMemberName();

        notice.setPostAuthor(memberName);
        notice.setPostContent(postContent);
        notice.setPostTitle(postTitle);

        try {
            noticeService.insertNotice(notice);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(NoticeError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/notice/update/postHit")
    public ResponseObject<Notice> updatePostHit(
            @RequestParam(value = "postId", required = true) int postId) throws Throwable {

        ResponseObject<Notice> ret = new ResponseObject<>();
        Notice notice = new Notice();

        notice.setPostId(postId);
        notice = noticeService.selectNoticeDetails(notice);
        notice.setPostHit(notice.getPostHit() + 1);

        try {
            noticeService.updatePostHit(notice);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(noticeError)", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/notice/update")
    public ResponseObject<List<Notice>> update(
            @RequestParam(value = "postContent", required = true) String postContent,
            @RequestParam(value = "postId", required = true) int postId,
            @RequestParam(value = "postTitle", required = true) String postTitle) throws Throwable{

        ResponseObject<List<Notice>> ret = new ResponseObject<>();
        Notice notice = new Notice();

        notice.setPostContent(postContent);
        notice.setPostId(postId);
        notice.setPostTitle(postTitle);

        try {
            noticeService.updateNotice(notice);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(NoticeError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;

    }

    @RequestMapping("/notice/delete")
    public ResponseObject<List<Notice>> deleteDestructionList(@RequestParam("postId") int postId){

        ResponseObject<List<Notice>> ret = new ResponseObject<>();
        Notice notice = new Notice();

        notice.setPostId(postId);

        try {
            noticeService.deleteNotice(notice);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(NoticeError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }
}
