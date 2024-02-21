package com.nexmotion.board.notice;

import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.List;

@Mapper
public interface NoticeMapper {

    public List<Notice> selectNotice(int offset, int pageSize) throws SQLException;
    public Notice selectNoticeDetails(Notice notice) throws SQLException;
    public void insertNotice(Notice notice) throws SQLException;
    public void updateNotice(Notice notice) throws SQLException;
    public void deleteNotice(Notice notice) throws SQLException;
    public void updatePostHit(Notice notice) throws  SQLException;

}
