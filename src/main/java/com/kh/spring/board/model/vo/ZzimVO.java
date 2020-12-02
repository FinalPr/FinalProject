package com.kh.spring.board.model.vo;

import java.sql.Date;

public class ZzimVO {
	int no;
	String category;
	String id;
	Date insert_date;
	
	public ZzimVO() {}

	public ZzimVO(int no, String category, String id, Date insert_date) {
		super();
		this.no = no;
		this.category = category;
		this.id = id;
		this.insert_date = insert_date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getInsert_date() {
		return insert_date;
	}

	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}

	@Override
	public String toString() {
		return "ZzimVO [no=" + no + ", category=" + category + ", id=" + id + ", insert_date=" + insert_date + "]";
	}
	
	
	
}
