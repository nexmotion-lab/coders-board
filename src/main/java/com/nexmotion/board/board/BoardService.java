package com.nexmotion.board.board;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class BoardService implements BoardMapper{

    private Logger logger = LoggerFactory.getLogger(BoardService.class);

    @Autowired
    BoardMapper boardMapper;

    @Override
    public List<Board> selectBoard(Board board) throws SQLException {
        return boardMapper.selectBoard(board);
    }

    @Override
    public void insertBoard(Board board) throws SQLException {
        boardMapper.insertBoard(board);
    }

}
