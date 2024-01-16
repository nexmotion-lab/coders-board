package com.nexmotion.board.news;

import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.List;

@Mapper
public interface NewsMapper {
    public List<News> selectNews(News news) throws SQLException;
    public void insertNews(News news) throws SQLException;
    public void updateNews(News news) throws SQLException;
    public void deleteNews(News news) throws SQLException;


}
