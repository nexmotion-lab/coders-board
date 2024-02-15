package com.nexmotion.board.paging;

import com.nexmotion.board.common.ResponseObject;
import com.nexmotion.board.common.StatusCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PagingRestController {

    private final Logger logger = LoggerFactory.getLogger(PagingRestController.class);

    @Autowired
    PagingService pagingService;

    @RequestMapping("/paging")
    public ResponseObject<Paging> pagination(
            @RequestParam(name = "page", defaultValue = "1") int page) throws Throwable {

        System.out.println("*** currentPage : " + page);
        ResponseObject<Paging> ret = new ResponseObject<>();
        Paging paging;

        try {
            int totalListCnt = pagingService.getNoticeListCnt();
            paging = new Paging(page, totalListCnt);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(pagingError)", e);
            return ret;
        }
        ret.setData(paging);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }
}
