package com.kg.fieldluxe.reply.model;

import java.util.Date;

public class ReplyVO {

	private int replyId;
	private int inquiryId;
	private String replyContent;
	private String replyWriter;
	private Date replyRegDate;
	
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", inquiryId=" + inquiryId + ", replyContent=" + replyContent
				+ ", replyWriter=" + replyWriter + ", replyRegDate=" + replyRegDate + "]";
	}
}
