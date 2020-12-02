package com.kh.spring.board.model.vo;

import java.sql.Date;

public class CommentVO {
			
	private int no;
	private int sub_no;
	private int ref_bno;
	private String category;
	private String content;
	private String towho;
	private String writer;
	private Date insert_date;
	private Date update_date;
	private char isReported;
	private char isDeleted;
	
	public CommentVO() {}

	public CommentVO(int no, int sub_no, int ref_bno, String category, String content, String towho, String writer,
			Date insert_date, Date update_date, char isReported, char isDeleted) {
		super();
		this.no = no;
		this.sub_no = sub_no;
		this.ref_bno = ref_bno;
		this.category = category;
		this.content = content;
		this.towho = towho;
		this.writer = writer;
		this.insert_date = insert_date;
		this.update_date = update_date;
		this.isReported = isReported;
		this.isDeleted = isDeleted;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSub_no() {
		return sub_no;
	}

	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}

	public int getRef_bno() {
		return ref_bno;
	}

	public void setRef_bno(int ref_bno) {
		this.ref_bno = ref_bno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTowho() {
		return towho;
	}

	public void setTowho(String towho) {
		this.towho = towho;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public char getIsReported() {
		return isReported;
	}

	public void setIsReported(char isReported) {
		this.isReported = isReported;
	}

	public char getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(char isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", sub_no=" + sub_no + ", ref_bno=" + ref_bno + ", category=" + category
				+ ", content=" + content + ", towho=" + towho + ", writer=" + writer + ", insert_date=" + insert_date
				+ ", update_date=" + update_date + ", isReported=" + isReported + ", isDeleted=" + isDeleted + "]";
	}
	
	
	
	
	
	
	
}
