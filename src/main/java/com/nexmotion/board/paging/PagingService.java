package com.nexmotion.board.paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class PagingService implements PagingMapper{

    @Autowired
    PagingMapper pagingMapper;

    @Override
    public int getNoticeListCnt() throws SQLException {
        return pagingMapper.getNoticeListCnt();
    }
}
