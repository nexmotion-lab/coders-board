package com.nexmotion.board.board;

import com.nexmotion.board.common.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BoardRestController {

  @Autowired
  private BoardService boardService;

  @RequestMapping("/select")
  public ResponseObject<List<Board>> select() {

  ResponseObject<List<Board>> ret = new ResponseObject<>();
  List<Board> board = null;

    try {
      board = boardService.selectBoard();
      ret.setData(board);
  } catch (Exception e) {
  }
    return ret;
}

}
