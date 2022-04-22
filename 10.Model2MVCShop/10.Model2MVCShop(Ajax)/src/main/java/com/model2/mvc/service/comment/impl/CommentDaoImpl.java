package com.model2.mvc.service.comment.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.comment.CommentDao;
import com.model2.mvc.service.domain.Comment;

@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public CommentDaoImpl(){
		System.out.println(" CommentDaoImpl »ý¼ºÀÚ");
	}
	
	@Override
	public void addComment(Comment comment) throws Exception {
		
		System.out.println(" addCommentDaoImpl Comment : " + comment);
		
		sqlSession.insert("CommentMapper.addComment",comment);
	}
	
	@Override
	public Map<String, Object> getCommentList(int prodNo) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Comment> list = sqlSession.selectList("CommentMapper.getCommentList", prodNo);
		System.out.println(" :: " + list + "\n");
		map.put("list", list);
		
		return map;
	}
}