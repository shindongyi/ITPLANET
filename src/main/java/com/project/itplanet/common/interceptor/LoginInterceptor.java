package com.project.itplanet.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.itplanet.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String referer = request.getHeader("Referer");
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			logger.info("비로그인 상태에서 [" + request.getRequestURI() + "]에 접근하려고 함");
			
			
//			request.setAttribute("msg", "마이페이지는 로그인을 하셔야 이용하실 수 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/loginView.jsp").forward(request, response);
			
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
