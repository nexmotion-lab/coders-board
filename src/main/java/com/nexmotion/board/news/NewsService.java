package com.nexmotion.board.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class NewsService implements NewsMapper{

    @Autowired
    NewsMapper newsMapper;

    @Override
    public List<News> selectNews(News news) throws SQLException {
        return newsMapper.selectNews(news);
    }

    @Override
    public void insertNews(News news) throws SQLException {
        newsMapper.insertNews(news);
    }

    @Override
    public void updateNews(News news) throws SQLException {
        newsMapper.updateNews(news);
    }

    @Override
    public void deleteNews(News news) throws SQLException {
        newsMapper.deleteNews(news);
    }

}
