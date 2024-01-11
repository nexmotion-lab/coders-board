package com.nexmotion.board.board;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Board {
    int postId;
    int boardCode;
    String postAuthor;
    String postTitle;
    LocalDateTime postDate;
    LocalDateTime postUpdateDate;
    String postContent;
    int postHit;
    String postDeleteYn;
}
