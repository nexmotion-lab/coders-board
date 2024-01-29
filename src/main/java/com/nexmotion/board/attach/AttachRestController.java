package com.nexmotion.board.attach;

import com.nexmotion.board.common.ResponseObject;
import com.nexmotion.board.common.StatusCode;
import com.nexmotion.board.free.Free;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
public class AttachRestController {
    private final Logger logger= LoggerFactory.getLogger(AttachRestController.class);

    @Autowired
    AttachService attachService;

    @RequestMapping("/attach/select")
    @ResponseBody
    public ResponseObject<List<Attach>> select (
            @RequestParam(value = "postId", required = false) Integer postId,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postTitle", required = false) String postTitle,
            @RequestParam(value = "postContent", required = false) String postContent) throws Throwable{

        ResponseObject<List<Attach>> ret = new ResponseObject<>();
        Attach attach = new Attach();
        List<Attach> attachList = null;
        if (postId != null) attach.setPostId(postId);
        if (postAuthor != null) attach.setPostAuthor(postAuthor);
        if (postTitle != null) attach.setPostTitle(postTitle);
        if (postContent != null) attach.setPostContent(postContent);

        try {
            attachList = attachService.selectAttach(attach);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(AttachError)", e);
            return ret;
        }
        ret.setData(attachList);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/attach/details/select")
    public ResponseObject<Attach> selectDetails(
            @RequestParam(value = "postId", required = true) int postId) throws Throwable {

        ResponseObject<Attach> ret = new ResponseObject<>();
        Attach attach = new Attach();
        attach.setPostId(postId);

        try {
            attach = attachService.selectAttachDetails(attach);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(attachError)", e);
            return ret;
        }
        ret.setData(attach);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/attach/insert")
    public ResponseObject<List<Attach>> insert(
        @RequestParam(value = "postAuthor", required = true) String postAuthor,
        @RequestParam(value = "postTitle", required = true) String postTitle,
        @RequestParam(value = "postContent", required = true) String postContent) {

        ResponseObject<List<Attach>> ret = new ResponseObject<>();
        Attach attach = new Attach();

        attach.setPostAuthor(postAuthor);
        attach.setPostTitle(postTitle);
        attach.setPostContent(postContent);

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
            @RequestParam(value = "postTitle", required = true) String postTitle,
            @RequestParam(value = "postContent", required = true) String postContent,
            @RequestParam(value = "postId", required = true) int postId) {

        ResponseObject<List<Attach>> ret = new ResponseObject<>();
        Attach attach = new Attach();

        attach.setPostTitle(postTitle);
        attach.setPostContent(postContent);
        attach.setPostId(postId);

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
            logger.error("ERROR_SERVICE(attachError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

}
