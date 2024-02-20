package com.nexmotion.board.attach;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class AttachService implements AttachMapper {

    @Autowired
    AttachMapper attachMapper;

    @Override
    public List<Attach> selectAttach(Attach attach) throws SQLException {
        return attachMapper.selectAttach(attach);
    }

    @Override
    public Attach selectAttachDetails(Attach attach) throws SQLException {
        return attachMapper.selectAttachDetails(attach);
    }

    @Override
    public List<Attach> selectAttachSearch(String keyword) throws SQLException{
        return attachMapper.selectAttachSearch(keyword);
    }

    @Override
    public void insertAttach(Attach attach) throws SQLException {
        attachMapper.insertAttach(attach);
    }

    @Override
    public void updateAttach(Attach attach) throws SQLException {
        attachMapper.updateAttach(attach);
    }

    @Override
    public void deleteAttach(Attach attach) throws SQLException {
        attachMapper.deleteAttach(attach);
    }

    @Override
    public void updatePostHit(Attach attach) throws SQLException{
        attachMapper.updatePostHit(attach);
    }

}
