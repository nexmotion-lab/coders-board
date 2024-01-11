package com.nexmotion.board.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AccountService implements UserDetailsService, AccountMapper{

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    PasswordEncoder encoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Account account = null;
        try {
            account = getAccount(username);
        } catch (Throwable e) {
            throw new UsernameNotFoundException(username);
        }
        if (account == null) {
            throw new UsernameNotFoundException(username);
        }

        return account;
    }

    @Override
    public Account getAccount(String userid) throws Throwable {

        AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
        return mapper.getAccount(userid);
    }
}
