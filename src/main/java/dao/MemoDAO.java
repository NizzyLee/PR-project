package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;
import vo.MemoVO;

public class MemoDAO {
SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	 //전체 게시물 수 조회
	public int getRowTotal() {
		int count = sqlSession.selectOne("o.memo_count");
		return count;
	}
	//방명록 전체조회
	public List<MemoVO> selectList(Map<String, Integer> map){
		 List<MemoVO> list = sqlSession.selectList("o.memo_list", map);
		 return list;
		}
	//방명록 전체조회
	/*
	 * public List<MemoVO> selectListOne(int idx){ List<MemoVO> list =
	 * sqlSession.selectList("o.memo_list", idx); return list; }
	 */
	//게시글 삭제
	public int delete(int idx) {
		int res= sqlSession.delete("o.memo_delete", idx);
		return res;
		
	}
	
	//새글 쓰기 VisitVO를 파라미터로 받을것임
	public int insert(MemoVO vo) {
				
		int res =sqlSession.insert("o.memo_insert", vo); //파라미터는 1개씩만 보낼 수 있음. vo하나로 다보냄
		return res;

	}
	
	//수정할 게시글 한건 검색
	public MemoVO selectOne(int idx) {
		MemoVO vo = sqlSession.selectOne("o.memo_one", idx);
		//idx를 where절에 넣어서 그걸 VisitVO vo에 넣어줘라
		return vo;
	}
	
	//수정시작
	public int update(MemoVO vo) {
		int res = sqlSession.update("o.memo_update", vo);
		return res;
	}
}
