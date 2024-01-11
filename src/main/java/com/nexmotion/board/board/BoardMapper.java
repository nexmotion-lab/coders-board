package com.nexmotion.board.board;

import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.List;

@Mapper
public interface BoardMapper {

    public List<Board> selectBoard(Board board) throws SQLException;

    public void insertBoard(Board board) throws SQLException;

}
