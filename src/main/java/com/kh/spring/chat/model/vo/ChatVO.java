package com.kh.spring.chat.model.vo;

import oracle.sql.DATE;

public class ChatVO {
	private int c_no;
	private int no;
	private String category;
	private int room;
	private String id;
	private String content;
	private DATE insert_date;
	private String name;
	private DATE room_date;
	public ChatVO() {}
	public ChatVO(int c_no, int no, String category, int room, String id, String content, DATE insert_date, String name,
			DATE room_date) {
		super();
		this.c_no = c_no;
		this.no = no;
		this.category = category;
		this.room = room;
		this.id = id;
		this.content = content;
		this.insert_date = insert_date;
		this.name = name;
		this.room_date = room_date;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
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
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public DATE getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(DATE insert_date) {
		this.insert_date = insert_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public DATE getRoom_date() {
		return room_date;
	}
	public void setRoom_date(DATE room_date) {
		this.room_date = room_date;
	}
	@Override
	public String toString() {
		return "ChatVO [c_no=" + c_no + ", no=" + no + ", category=" + category + ", room=" + room + ", id=" + id
				+ ", content=" + content + ", insert_date=" + insert_date + ", name=" + name + ", room_date="
				+ room_date + "]";
	}

	
	
	
	
	
}
