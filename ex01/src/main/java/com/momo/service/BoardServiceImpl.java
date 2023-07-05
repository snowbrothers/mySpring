package com.momo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momo.mapper.BoardMapper;
import com.momo.vo.BoardVO;

/**
 * 각 계층간의 연결 >> 인터페이스를 이용 느슨한 결합
 * 	컴포넌트간의 내부 의존성을 줄인다.
 * 
 * 	- Service 
 * 		계층 구조상 비즈니스 영역을 담당하는 객체임을 표시
 * 
 * 	- root-context.xml
 * 		component-scan 속성에 패키지를 등록 합시다.
 * 
 * 	- 서비스를 Interface 로 생성하는 이유 ! 
 * 		
 * 	1. 내부로직의 분리
 * 		인터페이스를 사용함으로써 내부로직의 변경, 수정시 유연한 대처 가능
 *  2. 구현체의 전환 용이
 *  	구현체의 변경, 교체가 용이
 *  3. 테스트의 용이성
 *  	단위테스트시 테스트용 구현체를 이용함으로써 테스트 수행
 * 	
 * @author user
 *
 */

@Service
public class BoardServiceImpl implements BoardService {

	// ! 인터페이스의 메서드 구현 ! 
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getListXml() {
		
		
		
		return boardMapper.getListXml();
	}

	@Override
	public int insert(BoardVO board) {
		
		int res = 0;
		
		res = boardMapper.insert(board);
		
		return res ;
	}

	@Override
	public int insertSelectKey(BoardVO board) {
		// TODO Auto-generated method stub
		int res = 0;
		
		res = boardMapper.insertSelectKey(board);
		
		return res;
	}

	/**
	 * 상세보기
	 */
	@Override
	public BoardVO getOne(int bno) {
		
		BoardVO board = boardMapper.getOne(bno);
		
		return board;
	}

	@Override
	public int delete(int bno) {
	
		int res = 0;
		
		boardMapper.delete(bno);
		
		return res;
	}

	@Override
	public int update(BoardVO board) {
		
		int res = 0;
		
		boardMapper.update(board);
		
		return res;
	}

	@Override
	public int getTotalCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
