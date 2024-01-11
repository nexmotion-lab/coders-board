package com.nexmotion.board.account;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AccountMapper {

    public Account getAccount(@Param("userid") String userid) throws Throwable;
}
