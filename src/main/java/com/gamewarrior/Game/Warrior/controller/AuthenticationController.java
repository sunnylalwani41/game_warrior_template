package com.gamewarrior.Game.Warrior.controller;

import com.gamewarrior.Game.Warrior.configure.SecurityConfig;
import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.service.AuthenticationService;
import com.gamewarrior.Game.Warrior.service.Email;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

@Controller
public class AuthenticationController {
    @Autowired
    private Email email;

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private SecurityConfig securityConfig;

    @ResponseBody
    @PostMapping("/sendAuthentication")
    public User sendEmailForAuthenticationHandler
            (@RequestBody Map<String, Object> map, HttpSession session) throws MessagingException, UserException, NoSuchAlgorithmException {
        User user = new User();

        user.setFirstName((String)map.get("firstName"));
        user.setLastName((String)map.get("lastName"));
        user.setEmail((String)map.get("email"));
        user.setVerify(false);
        user.setPassword(securityConfig.encryptPassword((String)map.get("password")));

        return authenticationService.saveUserDetail(user, session);
    }
    @ResponseBody
    @PostMapping("/verifyOtp")
    public boolean matchOtpHandler(@RequestBody Map<String, Object> map, HttpSession session) throws OtpException, MessagingException, UserException {
        return authenticationService.verifyOtpValue((String)map.get("otp"), session);
    }
}