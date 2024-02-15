package com.nexmotion.board.paging;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.sql.SQLException;

@Mapper
public interface PagingMapper {
    @Select("SELECT COUNT(*) FROM notice_board")
    public int getNoticeListCnt() throws SQLException;
}
