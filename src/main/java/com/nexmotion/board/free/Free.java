package com.nexmotion.board.free;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Free {

    private Integer postId;
    private String postAuthor;
    private String postTitle;
    private LocalDateTime postDate;
    private LocalDateTime postUpdateDate;
    private String postContent;
    private Integer postHit;
    private String postDeleteYn;
}
