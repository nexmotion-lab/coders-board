package com.nexmotion.board.free;

import com.nexmotion.board.notice.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.List;

@Mapper
public interface FreeMapper {

    public List<Free> selectFree(int offset, int limit) throws SQLException;
    public void insertFree(Free free) throws SQLException;
    public void updateFree(Free free) throws SQLException;
    public void deleteFree(Free free) throws SQLException;

}
