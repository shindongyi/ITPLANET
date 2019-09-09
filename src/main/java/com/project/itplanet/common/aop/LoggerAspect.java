package com.project.itplanet.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerAspect {
	// log를 넣는 aspect
	private Logger logger = LoggerFactory.getLogger(LoggerAspect.class);
	
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
								// ProceedingJoinPoint 어디에서 실행될지 지정해주는 애
		
//		============ Target Object에 대한 정보 추출 시작 ==============
		
		Signature signature = joinPoint.getSignature();
					// getSignature() : 메소드에 대한 정보가 담겨 있음
		// signature : 메소드의 반환 값과 어떤 클래스 안에 어떤 메소드를 불렀다는 내용이 담겨 옴
//						ex) 메모 버튼을 눌렀을 경우 : 
//								ModelAndView com.kh.spring.memo.controller.MemoController.memeo()
		
		logger.debug("signature = " + signature);
					
		String type = signature.getDeclaringTypeName(); 
		// getDeclaringTypeName() : 어디에 명시되어 있는지 가져옴
		// 			ex) com.kh.spring.memo.controller.MemoController
		logger.debug("type = " + type);
		
		String methodName = signature.getName();
		// methodName : 메소드 이름이 나옴
//					ex) memo
		logger.debug("methodName = " + methodName);
		
//		============ Target Object에 대한 정보 추출 끝 ==============
		
		String componentName = "";
		if(type.indexOf("Controller") > -1) {
			componentName = "Controller : ";
		} else if(type.indexOf("Service") > -1){
			componentName = "ServiceImpl : ";
		} else if(type.indexOf("DAO") > -1){
			componentName = "DAO : ";
		}
		
		// after를 위한 주석 처리
//		logger.debug("[Before]"+componentName + type + "." + methodName + "()");
//		
//		
//		return joinPoint.proceed();
		
					// joinPoint.proceed() : 위에 있는거 전부 모았으니까 target Object 실행해 
		// Aspect 생성 끝
		// AOP 등록은 Aspect-context만들어서 할건데 그때 web.xml에서 <servlet>으로 aspect-context 경로 설정 해줘야함
		
		logger.debug("[Before]"+componentName + type + "." + methodName + "()");
		Object obj = joinPoint.proceed();
		logger.debug("[After]"+componentName + type + "." + methodName + "()");
		return obj;
		
	}
}
