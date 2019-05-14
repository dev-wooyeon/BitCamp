package com.model2.mvc.service.comment;

import java.util.Map;

import com.model2.mvc.service.domain.Comment;

public interface CommentService {
	
	public void addComment(Comment comment) throws Exception;

	public Map<String, Object> getCommentList(int prodNo) throws Exception;

	//public CommentVO getProduct(int prodNo) throws Exception;

	//public HashMap<String,Object> getProductList(SearchVO searchVO) throws Exception;

	//public void updateProduct(ProductVO productVO) throws Exception;

}