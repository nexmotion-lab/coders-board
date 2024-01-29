package com.nexmotion.board.account;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class Account implements UserDetails {

    private String userid;
    private String password;
    private String memberName;
    private String authority;
    private boolean isAccountNonExpired;
    private boolean isAccountNonLocked;
    private boolean isCredentialsNonExpired;
    private boolean isEnabled;

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public void setAccountNonExpired(boolean isAccountNonExpired) {
        this.isAccountNonExpired = isAccountNonExpired;
    }

    public void setAccountNonLocked(boolean isAccountNonLocked) {
        this.isAccountNonLocked = isAccountNonLocked;
    }

    public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
        this.isCredentialsNonExpired = isCredentialsNonExpired;
    }

    public void setEnabled(boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public String getUserid() {
        return this.userid;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(getAuthority()));
        return authorities;

    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.userid;
    }

    public String getMemberName() {
        return memberName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return this.isAccountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
        return this.isAccountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return this.isCredentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
        return this.isEnabled;
    }

    @Override
    public String toString() {
        return "Account [userid=" + userid + ", password=" + password + ", memberName=" + memberName +
                ", authority=" + authority + ", isAccountNonExpired=" + isAccountNonExpired
                + ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialsNonExpired="
                + isCredentialsNonExpired + ", isEnabled=" + isEnabled + "]";
    }

}