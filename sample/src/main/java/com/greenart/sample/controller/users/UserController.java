package com.greenart.sample.controller.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.greenart.sample.model.UserVO;
import com.greenart.sample.service.users.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() {
		return "users/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String setRegister(@ModelAttribute UserVO vo) {// Model 저장 View 화면 이동 //ModelAndView 저장도 하면서 보여 주는 것이다
		int result = userService.setUser(vo);// 긴 문장을 간략화 하기 위해서 사용
		StringBuilder sb = new StringBuilder();
		
		if (result > 0) {
			String msg = "회원가입이 완료 되었습니다.";
			sb.append("<script>");
			sb.append("alert('" + msg + "');");
			sb.append("location.replace('/login');");
			sb.append("</script>");

		}

		return sb.toString();

	}
		

	@RequestMapping("/idCheck")
	@ResponseBody // javascript 사용시
	public String idCheck(@RequestParam String userid) {// ajax 쪽에서 넘어
		int result = userService.idCheck(userid);

		String str = null;
		if (result > 0) {
			str = "NO";

		} else {
			str = "YES";
		}
		return str;
	}

	
	
}