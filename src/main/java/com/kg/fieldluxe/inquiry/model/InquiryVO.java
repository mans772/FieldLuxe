package com.kg.fieldluxe.inquiry.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class InquiryVO {
	
	private int inquiryId;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryEmail;
	private Date inquiryRegDate;
	private int answerComplete;
	private String auth;
	private int cnt;
	
	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryEmail() {
		return inquiryEmail;
	}

	public void setInquiryEmail(String inquiryEmail) {
		this.inquiryEmail = inquiryEmail;
	}

	public Date getInquiryRegDate() {
		return inquiryRegDate;
	}

	public void setInquiryRegDate(Date inquiryRegDate) {
		this.inquiryRegDate = inquiryRegDate;
	}

	public boolean isAnswerComplete() {
		return this.answerComplete == 0 ? false : true;
	}

	public void setAnswerComplete(int answerComplete) {
		this.answerComplete = answerComplete;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(this.auth));
		return authorities;
	}
}
