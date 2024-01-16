package com.nexmotion.board.news;

import com.nexmotion.board.common.ResponseObject;
import com.nexmotion.board.common.StatusCode;
import com.nexmotion.board.news.News;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

@RestController
public class NewsRestController {
    private final Logger logger= LoggerFactory.getLogger(NewsRestController.class);

    @Autowired
    NewsService newsService;

    @RequestMapping("/news/select")
    public ResponseObject<List<News>> select (
            @RequestParam(value = "postId", required = false) int postId,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postTitle", required = false) String postTitle,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postHit", required = false) int postHit,
            @RequestParam(value = "postDeleteYn", required = false) String postDeleteYn) throws Throwable{

        ResponseObject<List<News>> ret = new ResponseObject<>();
        News news = new News();
        List<News> newsList = null;

        news.setBoardCode(2);
        news.setPostAuthor(postAuthor);
        news.setPostContent(postContent);
        news.setPostId(postId);
        news.setPostHit(postHit);
        news.setPostDeleteYn(postDeleteYn);
        news.setPostTitle(postTitle);

        try {
            newsList = newsService.selectNews(news);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(newsError)", e);
            return ret;
        }
        ret.setData(newsList);
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/news/insert")
    public ResponseObject<List<News>> insert(
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postId", required = false) int postId,
            @RequestParam(value = "postHit", required = false) int postHit,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postDeleteYn", required = false) String postDeleteYn,
            @RequestParam(value = "postTitle", required = false) String postTitle) {

        ResponseObject<List<News>> ret = new ResponseObject<>();
        News news = new News();

        news.setBoardCode(2);
        news.setPostAuthor(postAuthor);
        news.setPostContent(postContent);
        news.setPostId(postId);
        news.setPostHit(postHit);
        news.setPostDeleteYn(postDeleteYn);
        news.setPostTitle(postTitle);

        try {
            newsService.insertNews(news);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(newsError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }

    @RequestMapping("/news/update")
    public ResponseObject<List<News>> update(
            @RequestParam(value = "postUpdateDate", required = false) LocalDateTime postUpdateDate,
            @RequestParam(value = "postAuthor", required = false) String postAuthor,
            @RequestParam(value = "postContent", required = false) String postContent,
            @RequestParam(value = "postId", required = false) int postId,
            @RequestParam(value = "postHit", required = false) int postHit,
            @RequestParam(value = "postDate", required = false) LocalDateTime postDate,
            @RequestParam(value = "postDeleteYn", required = false) String postDeleteYn,
            @RequestParam(value = "postTitle", required = false) String postTitle) {

        ResponseObject<List<News>> ret = new ResponseObject<>();
        News news = new News();

        news.setBoardCode(2);
        news.setPostAuthor(postAuthor);
        news.setPostContent(postContent);
        news.setPostId(postId);
        news.setPostHit(postHit);
        news.setPostDeleteYn(postDeleteYn);
        news.setPostTitle(postTitle);

        try {
            newsService.updateNews(news);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(newsError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;

    }

    @RequestMapping("/news/delete")
    public ResponseObject<List<News>> deleteDestructionList(@RequestParam("postId") int postId){

        ResponseObject<List<News>> ret = new ResponseObject<>();
        News news = new News();

        news.setPostId(postId);

        try {
            newsService.deleteNews(news);
        } catch (Exception e) {
            ret.setReturnCode(StatusCode.ERROR_SERVICE);
            logger.error("ERROR_SERVICE(newsError", e);
            return ret;
        }
        ret.setReturnCode(StatusCode.OK);
        return ret;
    }


}
