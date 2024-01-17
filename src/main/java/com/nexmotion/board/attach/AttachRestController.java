package com.nexmotion.board.attach;

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
public class AttachRestController {
    private final Logger logger= LoggerFactory.getLogger(AttachRestController.class);

    @Autowired
    AttachService attachService;

    @RequestMapping("/attach/select")
    public ResponseObject<List<Attach>> select (
            @RequestParam(value = "postId", required = false) int postId,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postTitle", required = false) String postTitle,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postHit", required = false) int postHit,
            @RequestParam(value = "postDeleteYn", required = false) String postDeleteYn) throws Throwable{

        ResponseObject<List<Attach>> ret = new ResponseObject<>();
        Attach attach = new Attach();
        List<Attach> attachList = null;

        attach.setBoardCode(2);
        attach.setPostAuthor(postAuthor);
        attach.setPostContent(postContent);
        attach.setPostId(postId);
        attach.setPostHit(postHit);
        attach.setPostDeleteYn(postDeleteYn);
        attach.setPostTitle(postTitle);

        try {
            attachList = attachService.selectAttach(attach);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(newsError)", e);
            return ret;
        }
        ret.setData(attachList);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/attach/insert")
    public ResponseObject<List<Attach>> insert(
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postId", required = false) int postId,
            @RequestParam(value = "postHit", required = false) int postHit,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postDeleteYn", required = false) String postDeleteYn,
            @RequestParam(value = "postTitle", required = false) String postTitle) {

        ResponseObject<List<Attach>> ret = new ResponseObject<>();
        Attach attach = new Attach();

        attach.setBoardCode(2);
        attach.setPostAuthor(postAuthor);
        attach.setPostContent(postContent);
        attach.setPostId(postId);
        attach.setPostHit(postHit);
        attach.setPostDeleteYn(postDeleteYn);
        attach.setPostTitle(postTitle);

        try {
            attachService.insertAttach(attach);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(attachError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/attach/update")
    public ResponseObject<List<Attach>> update(
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postId", required = false) int postId,
            @RequestParam(value = "postHit", required = false) int postHit,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postDeleteYn", required = false) String postDeleteYn,
            @RequestParam(value = "postTitle", required = false) String postTitle) {

        ResponseObject<List<Attach>> ret = new ResponseObject<>();
        Attach attach = new Attach();

        attach.setBoardCode(2);
        attach.setPostAuthor(postAuthor);
        attach.setPostContent(postContent);
        attach.setPostId(postId);
        attach.setPostHit(postHit);
        attach.setPostDeleteYn(postDeleteYn);
        attach.setPostTitle(postTitle);

        try {
            attachService.updateAttach(attach);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(attachError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;

    }

    @RequestMapping("/attach/delete")
    public ResponseObject<List<Attach>> deleteDestructionList(@RequestParam("postId") int postId){

        ResponseObject<List<Attach>> ret = new ResponseObject<>();
        Attach attach = new Attach();

        attach.setPostId(postId);

        try {
            attachService.deleteAttach(attach);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(newsError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }


}
