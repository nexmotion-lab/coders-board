package com.nexmotion.board.account;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    public String getCurrentUsername() {
        // Spring Security를 이용하여 현재 로그인한 사용자의 이름을 가져옴
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return null; // 사용자가 인증되지 않았을 경우
        }

        Object principal = authentication.getPrincipal();
        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        }

        // 만약 UserDetails가 아닌 다른 사용자 정보 객체를 사용하는 경우, 해당 객체의 getUsername()을 호출하면 됨
        // 예를 들어, principal.getClass().getMethod("getUsername").invoke(principal) 와 같이 호출할 수도 있음

        return null; // 예외 상황에 대한 처리
    }
    @Override
    public Account getAccount(String userid) throws Throwable {

        AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
        return mapper.getAccount(userid);
    }
}
