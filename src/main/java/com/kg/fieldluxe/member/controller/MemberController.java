package com.kg.fieldluxe.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kg.fieldluxe.member.model.MemberVO;
import com.kg.fieldluxe.member.service.IMemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bpe;
	
	// GET 회원가입
	@GetMapping("/insert")
	public void insert(Model model) {
		model.addAttribute("mem", new MemberVO());
		model.addAttribute("message", "insert");
	}
	// POST 회원가입
	@PostMapping("/insert")
	public String insert(@ModelAttribute("mem") @Valid MemberVO member, Model model, 
				BindingResult result, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()) {
			model.addAttribute("message", "insert");
			return "member/insert";
		}
		member.setPassword(bpe.encode(member.getPassword()));
		member.setBan(1);
		memberService.insertMember(member);
		redirectAttributes.addFlashAttribute("message", "회원 가입 완료!");
		return "redirect:/login";
	}
	
	@GetMapping("/update")
	public String update(String email, Model model) {
		MemberVO mem = memberService.getMember(email);
		model.addAttribute("mem", mem);
		return "member/update";
	}
	
	@PostMapping("/update")
	public String update(MemberVO mem, Authentication auth, 
			RedirectAttributes redirectAttributes) {
		System.out.println(mem.getEmail());
		System.out.println(mem.getPassword());
		System.out.println(memberService.getPassword(mem.getEmail()));

			if(bpe.matches("0000", memberService.getPassword(mem.getEmail()))){
			
			} else {
				throw new RuntimeException("비밀번호가 다릅니다.");
			}
		
		memberService.updateMember(mem);
		redirectAttributes.addFlashAttribute("message","회원 수정 완료");
		return "redirect:/member/view?email="+mem.getEmail();
	}
	
	@RequestMapping(value="/idCheck", produces="application/json; charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestBody Map<String, Object> allData) {
		Map <String, Object> map = new HashMap<String, Object>();
		String email = String.valueOf(allData.get("email"));
		int count = memberService.emailCheck(email);
		String result;
		if(count == 1) {
			result = "NO";
		} else {
			result = "OK";
		}
		map.put("emailResult", result);
		return map;
	}
	
	@RequestMapping(value="/nickCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> nickCheck(@RequestBody Map<String, Object> allData){
		Map<String, Object> map = new HashMap<String, Object>();
		String nickname = String.valueOf(allData.get("nickname"));
		int count = memberService.nickCheck(nickname);

		String result;
		if(count == 1) {
			result = "NO";
		} else {
			result = "OK";
		}
		map.put("nickResult", result);
		return map;
	}
	
	@GetMapping("/{email:.+}")
	public String view(@PathVariable String email, Model model) {
		model.addAttribute("mem",memberService.getMember(email));
		return "member/view";
	}
}
