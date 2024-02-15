package com.nexmotion.board.notice;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class NoticeService implements NoticeMapper{

    @Autowired
    NoticeMapper noticeMapper;

    @Override
    public List<Notice> selectNotice(int page, int pageSize) throws SQLException {
        int offset = (page - 1) * pageSize;
        return noticeMapper.selectNotice(offset, pageSize);
    }

    @Override
    public void insertNotice(Notice notice) throws SQLException {
        noticeMapper.insertNotice(notice);
    }

    @Override
    public void updateNotice(Notice notice) throws SQLException {
        noticeMapper.updateNotice(notice);
    }

    @Override
    public void deleteNotice(Notice notice) throws SQLException {
        noticeMapper.deleteNotice(notice);
    }
}
