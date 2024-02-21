package com.nexmotion.board.attach;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;
import java.util.List;

@Mapper
public interface AttachMapper {
    public List<Attach> selectAttach(Attach attach) throws SQLException;
    public Attach selectAttachDetails(Attach attach) throws SQLException;
    public List<Attach> selectAttachSearch(String keyword) throws SQLException;
    public void insertAttach(Attach attach) throws SQLException;
    public void updateAttach(Attach attach) throws SQLException;
    public void deleteAttach(Attach attach) throws SQLException;
    public void updatePostHit(Attach attach) throws  SQLException;

}
