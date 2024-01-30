package com.nexmotion.board.free;

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
public class FreeRestController {

    private final Logger logger = LoggerFactory.getLogger(FreeRestController.class);

    @Autowired
    FreeService freeService;
    @Autowired
    AccountService accountService;

    @RequestMapping("/free/select")
    public ResponseObject<List<Free>> select(
            @RequestParam(name = "postId", defaultValue = "2147483647") Integer postId) throws Throwable {

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        List<Free> freeList = null;

        try {
            freeList = freeService.selectFree(postId);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(freeError)", e);
            return ret;
        }
        ret.setData(freeList);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/free/details/select")
    public ResponseObject<Free> selectDetails(
            @RequestParam(value = "postId", required = false) int postId) throws Throwable {

        ResponseObject<Free> ret = new ResponseObject<>();
        Free free = new Free();
        Free freeDetails = null;

        free.setPostId(postId);

        try {
            freeDetails = freeService.selectFreeDetails(free);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(freeError)", e);
            return ret;
        }
        ret.setData(freeDetails);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/free/insert")
    public ResponseObject<List<Free>> insert(
            @RequestParam(name = "postTitle", required = false) String postTitle,
            @RequestParam(name = "postContent", required = false) String postContent) throws Throwable {

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        Free free = new Free();

        String userid = accountService.getCurrentUsername();

        String memberName = accountService.getAccount(userid).getMemberName();

        free.setPostAuthor(memberName);
        free.setPostTitle(postTitle);
        free.setPostContent(postContent);

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
            @RequestParam(value = "postId", required = false) int postId,
            @RequestParam(value = "postTitle", required = false) String postTitle,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate) throws Throwable {

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        Free free = new Free();

        free.setPostUpdateDate(postUpdateDate);
        free.setPostContent(postContent);
        free.setPostId(postId);
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

    @RequestMapping("/free/update/postHit")
    public ResponseObject<Free> updatePostHit(
            @RequestParam(value = "postId", required = false) int postId) throws Throwable {

        ResponseObject<Free> ret = new ResponseObject<>();
        Free free = new Free();

        free.setPostId(postId);
        free = freeService.selectFreeDetails(free);
        free.setPostHit(free.getPostHit() + 1);

        try {
            freeService.updatePostHit(free);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(freeError)", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/free/delete")
    public ResponseObject<List<Free>> deleteDestructionList(@RequestParam("postId") int postId){

        ResponseObject<List<Free>> ret = new ResponseObject<>();
        Free free = new Free();

        free.setPostId(postId);

        try {
            freeService.deleteFree(free);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(freeError)", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }
}
