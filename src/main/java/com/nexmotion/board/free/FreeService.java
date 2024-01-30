package com.nexmotion.board.free;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.SQLException;
import java.util.List;

@Service
public class FreeService implements FreeMapper{

    @Autowired
    FreeMapper freeMapper;

    @Override
    public List<Free> selectFree(int postId) throws SQLException {
        return freeMapper.selectFree(postId);
    }

    @Override
    public Free selectFreeDetails(Free free) throws SQLException {
        return freeMapper.selectFreeDetails(free);
    }

    @Override
    public void insertFree(Free free) throws SQLException {
        freeMapper.insertFree(free);
    }

    @Override
    public void updateFree(Free free) throws SQLException {
        freeMapper.updateFree(free);
    }

    @Override
    public void updatePostHit(Free free) throws SQLException {
        freeMapper.updatePostHit(free);
    }

    @Override
    public void deleteFree(Free free) throws SQLException {
        freeMapper.deleteFree(free);
    }
}
