package com.nexmotion.board.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {

    @RequestMapping("/auth/login")
    public String authLogin() {

        return "/auth/login";
    }
}
