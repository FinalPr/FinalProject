package com.kh.spring.member.model.vo;

import java.sql.Date;

public class StarVO {
	private int sno;
	private String id;
	private double star;
	private String buyer_id;
	private String seller_id;
	private String content;
	private Date insert_date;
	public StarVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StarVO(int sno, String id, double star, String buyer_id, String seller_id, String content,
			Date insert_date) {
		super();
		this.sno = sno;
		this.id = id;
		this.star = star;
		this.buyer_id = buyer_id;
		this.seller_id = seller_id;
		this.content = content;
		this.insert_date = insert_date;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	@Override
	public String toString() {
		return "StarVO [sno=" + sno + ", id=" + id + ", star=" + star + ", buyer_id=" + buyer_id + ", seller_id="
				+ seller_id + ", content=" + content + ", insert_date=" + insert_date + "]";
	}
	
	
}
