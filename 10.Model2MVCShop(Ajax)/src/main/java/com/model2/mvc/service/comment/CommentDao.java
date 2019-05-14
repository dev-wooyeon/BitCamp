package com.model2.mvc.service.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.Product;

public interface CommentDao {
	
	public void addComment(Comment comment) throws Exception;
		
	public Map<String, Object> getCommentList(int prodNo) throws Exception;

}