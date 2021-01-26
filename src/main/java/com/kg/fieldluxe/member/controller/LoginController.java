package com.kg.fieldluxe.member.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kg.fieldluxe.member.service.IMemberService;

@Controller
public class LoginController {

	@Autowired
	IMemberService memberService;
	
	// LOGIN
	@GetMapping("/login")
	public void login(Model model) {
	}
	
	// LOGOUT
	@PostMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// Login Check
	@RequestMapping("/loginCheck")
	public String loginCheck(Model model, HttpSession session) {
		Authentication authentication = 
				SecurityContextHolder.getContext().getAuthentication();
		session.removeAttribute("message");
		if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
			return "redirect:/";
		} else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_MASTER"))) {
			return "redirect:/";
		} else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_USER"))) {
			session.setAttribute("startTime", LocalDateTime.now());
			String url = "/";
			if(session.getAttribute("url")!=null) {
				url = (String)session.getAttribute("url");
			}
			return "redirect:"+url;
		}else {
			model.addAttribute("message", "로그인 되지 않았습니다.");
			return "/login";
		}
	}
}
