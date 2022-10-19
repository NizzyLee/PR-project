package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체게시글 조회
	public List<BoardVO> selectList( Map<String, Integer> map){
		List<BoardVO> list = sqlSession.selectList("b.board_list", map);
		return list;
	}
	
	//새글 추가
	public int insert( BoardVO vo ) {
		int res = sqlSession.insert("b.board_insert", vo);
		return res;
	}
	
	//상세보기를 위한 게시물 한 건 조회
	public BoardVO selectOne( int idx ) {
		
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		return vo;
		
	}
	
	//조회수 증가
	public int update_readhit( int idx ) {
		int res = sqlSession.update("b.update_readhit", idx);
		return res;
	}
	
	//댓글작성을 위한 step값 증가
	public int update_step( BoardVO vo ) {
		
		int res = sqlSession.update("b.update_step", vo);
		return res;
		
	}
	
	//댓글작성
	public int reply(BoardVO vo) {
		int res  = sqlSession.insert("b.board_reply", vo);
		return res;
	}
	
	//댓글삭제(된것처럼 업데이트)
	public int delete( BoardVO vo ) {
		int res = sqlSession.update("b.del_update", vo);
		return res;
	}
	
	//전체 게시물 수 조회
	public int getRowTotal() {
		int count = sqlSession.selectOne("b.board_count");
		return count;
	}
}





















