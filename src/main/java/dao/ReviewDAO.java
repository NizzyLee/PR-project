package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;
import vo.MemberVO;
import vo.MemoVO;
import vo.ReviewVO;

public class ReviewDAO {
SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//새글 쓰기 VisitVO를 파라미터로 받을것임
	public int insert(ReviewVO vo) {
				
		int res =sqlSession.insert("r.review_insert", vo); //파라미터는 1개씩만 보낼 수 있음. vo하나로 다보냄
		return res;

	}
	//전체게시글 조회
	public List<ReviewVO> selectlist(ReviewVO vo){
		List<ReviewVO> list = sqlSession.selectList("r.review_list", vo);
		return list;
	}
	

	public double selectAvg(String title) {
		double star =sqlSession.selectOne("r.review_star", title); 	
		return star;
	}

}
