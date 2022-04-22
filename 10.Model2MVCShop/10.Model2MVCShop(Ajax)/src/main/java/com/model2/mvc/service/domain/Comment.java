package com.model2.mvc.service.domain;

import java.sql.Date;


public class Comment {
	
	private int commentNo;
	private int prodNo;
	private String reply;
	private Date InputDate;
	
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getInputDate() {
		return InputDate;
	}
	public void setInputDate(Date inputDate) {
		InputDate = inputDate;
	}

	public String toString() {
		return "CommentVO : [commentNo]" + commentNo
				+ "[prodNo]" + prodNo+ "[reply]" + reply + "[InputDate]" + InputDate;
	}	
}