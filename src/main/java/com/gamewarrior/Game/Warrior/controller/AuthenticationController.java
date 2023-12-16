package com.gamewarrior.Game.Warrior.controller;

import com.gamewarrior.Game.Warrior.configure.SecurityConfig;
import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.service.AuthenticationService;
import com.gamewarrior.Game.Warrior.service.Email;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
        String password= (String)map.get("password");
        user.setPassword(securityConfig.encryptPassword(password));

        return authenticationService.saveUserDetail(user, session);
    }
    @ResponseBody
    @PostMapping("/verifyOtp")
    public ResponseEntity<String> matchOtpHandler(@RequestBody Map<String, Object> map, HttpSession session) throws OtpException, MessagingException, UserException {
        return new ResponseEntity<>(authenticationService.verifyOtpValue(String.valueOf(map.get("otp")), session), HttpStatus.ACCEPTED);
    }

    @ResponseBody
    @PostMapping("/verifyUser")
    public ResponseEntity<User> verifyUserHandler(@RequestBody Map<String, Object> map, HttpSession session) throws UserException, NoSuchAlgorithmException {
        return new ResponseEntity<>(authenticationService.matchUserCrediential(map, session), HttpStatus.OK);
    }
    

}