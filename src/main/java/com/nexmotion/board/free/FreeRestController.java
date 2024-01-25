package com.nexmotion.board.free;

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
public class FreeRestController {

    private final Logger logger = LoggerFactory.getLogger(FreeRestController.class);

    @Autowired
    FreeService freeService;

    @RequestMapping("/free/select")
    public ResponseObject<List<Free>> select(
            @RequestParam(value = "offset", defaultValue = "0") int offset,
            @RequestParam(value = "limit", defaultValue = "10") int limit,
            @RequestParam(value = "postId", required = false) Integer postId,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postHit", required = false) Integer postHit,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postTitle", required = false) String postTitle
            ) throws Throwable {

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        Free free = new Free();
        List<Free> freeList = null;

        free.setPostAuthor(postAuthor);
        free.setPostContent(postContent);
        free.setPostId(postId);
        free.setPostHit(postHit);
        free.setPostDate(postDate);
        free.setPostTitle(postTitle);

        try {
            freeList = freeService.selectFree(offset, limit);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(freeError)", e);
            return ret;
        }
        ret.setData(freeList);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/free/insert")
    public ResponseObject<List<Free>> insert(
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postTitle", required = false) String postTitle) throws Throwable {

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        Free free = new Free();

        free.setPostAuthor(postAuthor);
        free.setPostContent(postContent);
        free.setPostTitle(postTitle);

        try {
            freeService.insertFree(free);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(freeError)", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/free/update")
    public ResponseObject<List<Free>> update(
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postId", required = false) Integer postId,
            @RequestParam(value = "postHit", required = false) Integer postHit,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postDeleteYn", required = false) String postDeleteYn,
            @RequestParam(value = "postTitle", required = false) String postTitle) throws Throwable {

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        Free free = new Free();

        free.setPostUpdateDate(postUpdateDate);
        free.setPostAuthor(postAuthor);
        free.setPostContent(postContent);
        free.setPostId(postId);
        free.setPostHit(postHit);
        free.setPostDate(postDate);
        free.setPostDeleteYn(postDeleteYn);
        free.setPostTitle(postTitle);

        try {
            freeService.updateFree(free);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(freeError)", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/free/delete")
    public ResponseObject<List<Free>> deleteDestructionList(@RequestParam("postId") Integer postId){

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        Free free = new Free();

        free.setPostId(postId);

        try {
            freeService.deleteFree(free);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(FreeError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }
}
