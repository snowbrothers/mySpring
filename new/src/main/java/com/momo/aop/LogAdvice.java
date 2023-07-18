package com.momo.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import com.momo.service.LogService;
import com.momo.vo.LogVo;

import lombok.extern.log4j.Log4j;

/**
 * AOP(Aspect-Oriented Programming) 관점지향프로그래밍 핵심비즈니스 로직과 부가적인 관심사를 분리하여 개발하는 방법론
 * 
 * 코드의 중복을 줄이고 유지보수성을 향상시킬 수 있음.
 * 
 * 부가적인 관심사 로깅, 보안, 트랜잭션 관리 등 애플리케이션에서 공통적으로 처리해야 하는 기능
 * 
 * 오류 발생 시 데이터베이스에 저장
 * 
 * 
 * 
 * @author user
 *
 */

@Aspect
@Component
@Log4j
public class LogAdvice {

	/**
	 * 포인트컷 : 언제 어디에 적용할 것인지 기술
	 * 
	 * Before 타겟 객체의 메소드가 실행되기 전에 호출되는 어드바이스 joinPoint를 통해 파라미터 정보 참조 가능
	 */
	@Before("execution(* com.momo.service.Board*.*(..))")
	public void logBefore() {

		log.info("=================================");

	}

	/**
	 * joinPoint 타켓에 대한 정보와 상태를 담고 있는 객체로 매개변수로 받아서 사용
	 * 
	 * @param joinPoint
	 */
	@Before("execution(* com.momo.service.Reply*.*(..))")
	public void logBeforeParams(JoinPoint joinPoint) {

		log.info("============ AOP =============");
		log.info("Param" + Arrays.toString(joinPoint.getArgs()));
		log.info("Target" + joinPoint.getTarget());
		log.info("Method" + joinPoint.getSignature().getName());
	}

//	/**
//	 * Around 타겟의 메소드가 호출되기 이전 시점과 이후 시점에 모두 처리해야 할 필요가 있는 부가기능 정의
//	 * 
//	 * 주업무로직을 실행하기 위해 JoinPoint의 하위 클래스인 ProceedingJoinPoint 타입의 파라미터를 필수적으로 선언해야 함.
//	 * ProceedingJoinPoint 타입의 파라미터를 필수적으로 선언해야함.
//  	타겟 메서드의 실행결과를 반환하기 위해서 ..	
//	 * @return
//	 */
//	@Around("execution(* com.momo.service.Board*.*(..))")
//	public Object logTime(ProceedingJoinPoint pjp) {
//
//		StopWatch stopWatch = new StopWatch();
//		stopWatch.start();
//
//		Object res = "";
//		// 주 업무 로직 실행.
//		try {
//
//			res = pjp.proceed();
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
//
//		stopWatch.stop();
//		log.info("========================");
//		log.info(pjp.getTarget() + "." + pjp.getSignature().getName());
//		log.info("수행시간 : " + stopWatch.getTotalTimeMillis() + "(ms)초");
//		log.info("========================");
//
//		return res;
//	}

	@Autowired
	LogService logService;

	/**
	 * AfterThrowing
	 * 		타겟 메서드 실행 중 예외가 발생한 뒤에 실행할 부가기능
	 * 		오류가 발생내역을 테이블에 등록
	 * @param joinPoint
	 * @param exception
	 */
	@AfterThrowing(pointcut = "execution(* com.momo.service.*.*(..))", throwing = "exception")
	public void logException(JoinPoint joinPoint, Exception exception) {

		// 예외가 발생 시 예외 내용을 테이블에 저장합니다.

		try {
			LogVo vo = new LogVo();
			
			vo.setClassname(joinPoint.getClass().getName());
			vo.setMethodname(joinPoint.getSignature().getName());
			vo.setErrmsg(exception.getMessage());
			vo.setParams(Arrays.toString(joinPoint.getArgs()));
			
			
			logService.insert(vo);
			log.info("로그테이블 저장 ! ! ! ! ! ! ! ! ");
			
		} catch (Exception e) {

			log.info("로그테이블 저장중 예외 발생 ");
			log.info(e.getMessage());
			e.printStackTrace();

		}
	}
}