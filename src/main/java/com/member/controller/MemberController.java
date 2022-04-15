package com.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.domain.MemberVO;
import com.member.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입 폼 
	@GetMapping("signup")
	public void signup() {
		System.out.println("signup 폼 요청!!!");
	}
	// 회원가입 처리 
	@PostMapping("signup")
	public String signupPro(@ModelAttribute("member") MemberVO member, Model model) {
		System.out.println("signup 처리 요청!!!");
		
		// 넘어온 회원정보 DB 저장 -> 서비스야 회원가입처리일해~~ 
		int result = memberService.addMember(member);
		// 처리 결과 화면까지 보내줘~ 
		model.addAttribute("result", result);
		
		return "member/signupPro";
	}
	
	// 메인페이지 
	@GetMapping("main")
	public String main(@CookieValue(name="cookieAuto", required=false) String cookieAuto,HttpServletRequest request, HttpServletResponse response) {
		System.out.println("main 요청");
		
		// 쿠키 꺼내기 
		//Cookie[] coos = request.getCookies(); 
		//if(coos != null) {
		//	for(Cookie c : coos) {
		//		// 쿠키 있다 
		//		if(c.getName().equals("cookieAuto")) {
		//			memberService.login(null, c.getValue(), response);
		//		}
		//	}
		//}
		
		//쿠키가 꼭 있을 필요는 없으니 required false. 어노테이션은 쿠키의 값만 읽기 전용으로 뽑아오는 역할.
	      System.out.println("main 요청");
	      //쿠키 확인해서 로그인처리
	         if(cookieAuto!=null) {
	            memberService.login(null,cookieAuto,response);
	         }

	    //쿠키없다: 메인 가기
		return "member/main"; // String 처리 
	} 
	
	
	// 로그인 폼 
	@GetMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("로그인 폼 요청!!!");
		Cookie[] coos = request.getCookies(); 
		if(coos != null) {
			for(Cookie c : coos) {
				//  session X, cookie O
				if(c.getName().equals("cookieAuto")) {
					System.out.println("11111111111111111111111");
					// 쿠키 꺼내서 로그인 처리 -> session, cookie(갱신=쿠키생성) 
					memberService.login(null, c.getValue(), response);
					return "member/main"; // 메인페이지 보여줘 
				}
			}
		}
		return "member/login";  // 원래 요청한 login 폼페이지 보여줘 
	}
	
	// 로그인 처리 
	@PostMapping("login")
	public String loginPro(MemberVO member, String auto, Model model, HttpServletResponse response, HttpSession session) {
		System.out.println("로그인 처리 요청!!");
		
		System.out.println("auto : " + auto);
		
		int result = memberService.login(member, auto, response);
		
		String prevPage = null; 
		if(session.getAttribute("prevPage") != null) {
			prevPage = (String)session.getAttribute("prevPage"); 
			session.removeAttribute("prevPage");
		}
		if(prevPage != null) {
			return "redirect:"+prevPage;
		}
		
		
		model.addAttribute("result", result);
		
		return "member/loginPro";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		System.out.println("로그아웃 요청!!!!");
		// 서비스에 구현은 생략... 
		//session.invalidate(); // session에 들어있는 속성 모두 삭제 
		//session.removeAttribute("memId"); // memId 속성만 삭제 
		memberService.logout(response);
		
		return "redirect:/member/main"; // main으로 바로 이동 
	}
	
	// 마이페이지 
	@GetMapping("mypage")
	public void mypage() {
		System.out.println("mypage 요청!!!");
	}
	
	// 회원 정보 수정 폼 요청 
	@GetMapping("modify")
	public void modify(HttpSession session, Model model) {
		System.out.println("modify폼 요청!!");
		
		// 로그인한 회원 정보를 전체 뽑아서 뷰에 전달 
		// 서비스야 회원정보 DB에서 가져와서 나한테 전달해줘
		// #1. 컨트롤러에서 ID뽑아 서비스에 전달 
		//		세션에서 id 뽑기, Object로 돌려주니 String으로 형변환해서 담기 
		//String id =(String)session.getAttribute("memId"); 
		//MemberVO member = memberService.getMember(id); 
		MemberVO member = memberService.getMember(); 
		// 내가 받아서 뷰에 전달할게 
		model.addAttribute("member", member);
		
	}
	
	// 회원 정보 수정 처리 요청 
	@PostMapping("modify")
	public String modifyPro(MemberVO member, Model model) { // pw, age, email
		System.out.println("modify 처리 요청~~");
		
		// 서비스야~ DB에가서 넘어온데이터로 수정처리해줘~~ 
		int result = memberService.modifyMember(member); 
		System.out.println("C - result modify : " + result);
		// update springMember set pw=#{pw}, age=#{age}, email=#{email} 
		//	where id=#{id}
		model.addAttribute("result", result);
		
		return "member/modifyPro";
	}
	
	
	// 회원 탈퇴 폼 페이지 요청 
	@GetMapping("delete")
	public void delete() {
		System.out.println("delete 폼 요청!");
	}
	
	// 회원 탈퇴 처리 요청 
	@PostMapping("delete")
	public String deletePro(MemberVO member, Model model, HttpServletResponse response) { // pw 만 넘어옴 
		System.out.println("delete 처리 요청!!");
		
		// 서비스야, id와 pw가 맞는지 체크해서 맞으면 회원 정보 삭제해줘~~ 
		int result = memberService.deleteMember(member, response);
		System.out.println("C delete result : " + result);
		model.addAttribute("result", result);
		
		return "member/deletePro";
	}
	
	// 아이디 중복 확인 요청
	@RequestMapping("idAvail")
	public String idAvail(String id, Model model) {
		System.out.println("ID 중복확인 요청!!");
		
		// id값이 DB에 존재하는지 체크해서 view 결과 전달
		int result = memberService.idAvail(id);
		model.addAttribute("result", result);
		model.addAttribute("trialId", id);
		// result == 1 : 이미 DB에 존재함, 사용불가
		// result == 0 : DB에 없다, 사용가능
		
		return "member/idAvail";
	}
	/*
	@RequestMapping("ajaxIdAvail")
	@ResponseBody	//응답을 jsp페이지가 아닌, body(ajax요청한곳)으로 응답하겠다.
	public String ajaxIdAvail(String id) {
		System.out.println("ajaxIdAvail 요청!!");
		int result = memberService.idAvail(id);
		String resStr="";
		if(result==1) {
			resStr = "이미 존재합니다";
		}else {
			resStr = "사용 가능합니다";
		}
		
		return resStr;	// jsp페이지가 아닌 body로 응답해줄 데이터 전송(데이터가 문자열이라 리턴타입도 String)
	}
	*/
	
	@RequestMapping("ajaxIdAvail")
	public ResponseEntity<String> ajaxIdAvail(String id) {
		System.out.println("ajaxIdAvail 요청!!");
		int result = memberService.idAvail(id);
		String resStr="";
		if(result==1) {
			resStr = "이미 존재합니다";
		}else {
			resStr = "사용 가능합니다";
		}
		
		// 헤더정보 세팅
		HttpHeaders responseHeader = new HttpHeaders();
		responseHeader.add("content-Type", "text/html;charset=utf-8"); // 한글깨짐 방지 헤더정보
		
		return new ResponseEntity<String>(resStr, responseHeader, HttpStatus.OK);	
		// body에 전솔할데이터, 헤더객체, http상태코드 (ok=200, created=201)
	}
	
}
