package com.nexmotion.board.paging;

import lombok.Data;

@Data
public class Paging {
    //총 페이지 수
    private int totalPageCnt;
    //한 페이지 당 게시글 수(범위)
    private int pageSize = 10;
    //현재 페이지
    private int page;
    //총 게시글 개수
    private int totalListCnt;
    //페이징 범위 정보(블록) => ex) 1 ~ 10까지 : 1 / 11 ~ 20까지 : 2
    private int range;
    //페이징 범위 사이즈
    private int rangeSize = 10;
    //시작 페이지
    private int startPage;
    //마지막 페이지
    private int endPage;

    public Paging(int page, int totalListCnt) {
        this.page = page;
        this.totalListCnt = totalListCnt;
        this.range = (int)Math.ceil((double) page / rangeSize);
        this.totalPageCnt = (int) Math.ceil((double) totalListCnt / pageSize);
        this.startPage = (range - 1) * rangeSize + 1;
        this.endPage = range * rangeSize;
    }
}
