package com.model2.mvc.service.comment.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.comment.CommentDao;
import com.model2.mvc.service.comment.CommentService;
import com.model2.mvc.service.domain.Comment;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService{

	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	public CommentServiceImpl() {
		System.out.println(" CommentServiceImpl »ý¼ºÀÚ");
	}
	
	@Override
	public void addComment(Comment comment) throws Exception {
		commentDao.addComment(comment);
	}
	@Override
	public Map<String, Object> getCommentList(int prodNo) throws Exception {
		return commentDao.getCommentList(prodNo);
	}
	@Override
	public void updateCommentLike(int commentNo) throws Exception {
		commentDao.updateCommentLike(commentNo);	
	}
	@Override
	public Comment getComment(int commentNo) throws Exception {
		return commentDao.getComment(commentNo);
	}
	


}
