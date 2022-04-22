package com.model2.mvc.web.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.comment.CommentService;
import com.model2.mvc.service.domain.Comment;

@RestController
@RequestMapping("/comment/*")
public class CommnetRestController {
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	public void CommentRestController() {		
		System.out.println("CommentRestController Default Constructor");
	}
	
	@RequestMapping(value="json/commentLike/{commentNo}", method=RequestMethod.POST)
	public Comment commentLike(@PathVariable int commentNo) throws Exception {
		
		System.out.println( "commentLike commentNo : " + commentNo);
	    commentService.updateCommentLike(commentNo);
		
		return commentService.getComment(commentNo);
	}
}
